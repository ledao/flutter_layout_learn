import 'dart:math';

import 'package:flutter/material.dart';

class WrapLayoutPage extends StatefulWidget {
  const WrapLayoutPage({Key? key}) : super(key: key);

  @override
  State<WrapLayoutPage> createState() => _WrapLayoutPageState();
}

class _WrapLayoutPageState extends State<WrapLayoutPage> {
  late ScrollController _controller0;
  late ScrollController _controller1;
  late ScrollController _controller2;

  @override
  void initState() {
    _controller0 = ScrollController();
    _controller1 = ScrollController();
    _controller2 = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _controller0.dispose();
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("流式布局"),
      ),
      body: SingleChildScrollView(
        controller: _controller0,
        child: Column(
          children: [
            const Text("子组件未超出"),
            Wrap(
              spacing: 10.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: List.generate(5, (index) {
                return Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  child: Text("$index"),
                );
              }),
            ),
            const Divider(),
            const Text("子组件超出"),
            Wrap(
              spacing: 10.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: List.generate(25, (index) {
                return Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  child: Text("$index"),
                );
              }),
            ),
            const Divider(),
            const Text("子组件需要空间超过父组件提供空间"),
            Container(
              width: 1000,
              height: 200,
              color: Colors.green,
              child: Wrap(
                spacing: 10.0,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: List.generate(25, (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                    child: Text("$index"),
                  );
                }),
              ),
            ),
            const Divider(),
            const Text("我是被覆盖的下一个显示元素"),
          ],
        ),
      ),
    );
  }
}
