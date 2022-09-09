import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PositionedLayoutWidget extends StatefulWidget {
  const PositionedLayoutWidget({Key? key}) : super(key: key);

  @override
  State<PositionedLayoutWidget> createState() => _PositionedLayoutWidget();
}

class _PositionedLayoutWidget extends State<PositionedLayoutWidget> {
  late ScrollController _verticalController;
  late ScrollController _horizontalController;

  @override
  void initState() {
    _verticalController = ScrollController();
    _horizontalController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绝对定位"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Center"),
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                  child: Text("小矩形"),
                ),
              ),

            ),
            Divider(),
            Text("Positioned"),
            Container(
                width: 300,
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue,
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Text("小矩形，左上"),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Text("小矩形，左下"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Text("小矩形，右上"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Text("小矩形，右下"),
                      ),
                    ),
                  ],
                )),
            Divider(),
            Text("Align定位"),
            Row(
              children: [
                _buildAlignContainer("alignment: topLeft", Alignment.topLeft),
                _buildAlignContainer("alignment: topCenter", Alignment.topCenter),
                _buildAlignContainer("alignment: topRight", Alignment.topRight),
                _buildAlignContainer("alignment: centerLeft", Alignment.centerLeft),
                _buildAlignContainer("alignment: center", Alignment.center),
                _buildAlignContainer("alignment: centerRight", Alignment.centerRight),
                _buildAlignContainer("alignment: bottomLeft", Alignment.bottomLeft),
                _buildAlignContainer("alignment: bottomCenter", Alignment.bottomCenter),
                _buildAlignContainer("alignment: bottomRight", Alignment.bottomRight),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlignContainer(String text, Alignment alignment) {
    return Column(
      children: [
        Text(text),
        Container(
          width: 200,
          height: 200,
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          child: Align(
            alignment: alignment,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
              child: Text("小矩形"),
            ),
          ),
        ),
      ],
    );
  }
}
