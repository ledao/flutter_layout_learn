import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollLayoutPage extends StatefulWidget {
  const ScrollLayoutPage({Key? key}) : super(key: key);

  @override
  State<ScrollLayoutPage> createState() => _ScrollLayoutPageState();
}

class _ScrollLayoutPageState extends State<ScrollLayoutPage> {
  late ScrollController _verticalController;
  late ScrollController _horizontalController;
  late ScrollController _gridController;

  @override
  void initState() {
    _verticalController = ScrollController();
    _horizontalController = ScrollController();
    _gridController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    _gridController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动布局"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSingleChildScrollViewHorizontal(),
            Divider(),
            _buildSingleChildScrollViewVertical(),
            Divider(),
            _buildListViewVertical(),
            Divider(),
            _buildGridViewFixedCrossAxisCount(),
            Divider(),
            _buildGridViewMaxCrossAxisExtent(),
          ],
        ),
      ),
    );
  }

  Widget _buildGridViewMaxCrossAxisExtent() {
    return Column(
      children: [
        Text("GridView(MaxCrossAxisExtent)"),
        Container(
          height: 500,
          width: 600,
          color: Colors.grey,
          child: GridView(
            controller: _gridController,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200),
            children: List.generate(
                10,
                (index) => Container(
                    width: 50,
                    height: 50,
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                    child: Text("GridView $index"))),
          ),
        ),
      ],
    );
  }

  Widget _buildGridViewFixedCrossAxisCount() {
    return Column(
      children: [
        Text("GridView(FixedCrossAxisCount)"),
        Container(
          height: 500,
          width: 600,
          color: Colors.grey,
          child: GridView(
            controller: _gridController,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            children: List.generate(
                10,
                (index) => Container(
                    width: 50,
                    height: 50,
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                    child: Text("GridView $index"))),
          ),
        ),
      ],
    );
  }

  Widget _buildListViewVertical() {
    return Column(
      children: [
        Text("ListView垂直滚动列表(10个元素)"),
        Container(
          height: 100,
          width: 500,
          color: Colors.green,
          child: ListView(
            children: List.generate(10, (index) {
              return Center(child: Text("列表: $index"));
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleChildScrollViewHorizontal() {
    return Column(
      children: [
        Text("SingleChildScrollView水平滚动"),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          width: 600,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            }),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _horizontalController,
              child: Text(
                List.generate(20, (index) => "横看成岭侧成峰，远近高低各不同。不识庐山真面目，只缘身在此山中。")
                    .join(""),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleChildScrollViewVertical() {
    return Column(
      children: [
        Text("SingleChildScrollView垂直滚动"),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _verticalController,
            child: Text(
              List.generate(100, (index) => "横看成岭侧成峰，远近高低各不同。不识庐山真面目，只缘身在此山中。")
                  .join("\n"),
            ),
          ),
        ),
      ],
    );
  }
}
