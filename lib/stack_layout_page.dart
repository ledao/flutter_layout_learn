
import 'package:flutter/material.dart';

class StackLayoutPage extends StatefulWidget {
  const StackLayoutPage({Key? key}) : super(key: key);

  @override
  State<StackLayoutPage> createState() => _StackLayoutPage();
}

class _StackLayoutPage extends State<StackLayoutPage> {
  late ScrollController _verticalController;
  late ScrollController _horizontalController;
  late ScrollController _columnController;

  @override
  void initState() {
    _verticalController = ScrollController();
    _horizontalController = ScrollController();
    _columnController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    _columnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("层叠布局"),
      ),
      body: SingleChildScrollView(
        controller: _columnController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("堆叠布局，大矩形在底部，小矩形在顶部"),
            Stack(
              alignment: AlignmentDirectional.center,
              children: _buildRects(),
            ),
            const Divider(),
            const Text("堆叠布局，小矩形在底部，大矩形在顶部，此处中小矩形被彻底遮挡"),
            Stack(
              alignment: AlignmentDirectional.center,
              children: _buildRects().reversed.toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRects() {
    return [
            Center(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                child: const Text(
                  "大矩形",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: const Text(
                  "中矩形",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Text(
                  "小矩形",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ];
  }
}
