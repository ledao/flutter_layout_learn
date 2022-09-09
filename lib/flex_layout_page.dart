import 'dart:math';

import 'package:flutter/material.dart';

class FlexLayoutPage extends StatelessWidget {
  const FlexLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹性布局"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _build1(),
            const Divider(),
            _build2(),
          ],
        ),
      ),
    );
  }

  Widget _build2() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          const Text("线性与弹性混合使用，实现按钮贴于底部"),
          Expanded(
            child: Container(
              color: Colors.green,
              width: double.infinity,
              child: const Center(child: Text("中间可弹性伸缩空间")),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("底部按钮")),
        ],
      ),
    );
  }

  Widget _build1() {
    return Column(
      children: [
        const Text("3个元素，按20 20 60比例分配空间"),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                color: Color.fromARGB(
                  255,
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                color: Color.fromARGB(
                  255,
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: 100,
                height: 100,
                color: Color.fromARGB(
                  255,
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
