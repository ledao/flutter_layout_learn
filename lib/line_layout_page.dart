import 'dart:math';

import 'package:flutter/material.dart';

class LineLayoutWidget extends StatefulWidget {
  const LineLayoutWidget({Key? key}) : super(key: key);

  @override
  State<LineLayoutWidget> createState() => _LineLayoutWidgetState();
}

class _LineLayoutWidgetState extends State<LineLayoutWidget> {
  late ScrollController _controller0;

  @override
  void initState() {
    _controller0 = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _controller0.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("线性布局"),
      ),
      body: SingleChildScrollView(
        controller: _controller0,
        child: Column(
          children: [
            _buildRow(label: "row default:"),
            _buildRow(
                label: "row mainAxisSize(max):", mainAxisSize: MainAxisSize.max),
            _buildRow(
                label: "row mainAxisSize(min):", mainAxisSize: MainAxisSize.min),
            _buildRow(
                label: "row mainAxisAlignment(start):",
                mainAxisAlignment: MainAxisAlignment.start),
            _buildRow(
                label: "row mainAxisAlignment(end):",
                mainAxisAlignment: MainAxisAlignment.end),
            _buildRow(
                label: "row mainAxisAlignment(center):",
                mainAxisAlignment: MainAxisAlignment.center),
            _buildRow(
              label: "row mainAxisAlignment(spaceAround):",
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            _buildRow(
              label: "row mainAxisAlignment(spaceBetween):",
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            _buildRow(
              label: "row mainAxisAlignment(spaceEvenly):",
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            _buildRow(
              label: "row crossAxisAlignment(start):",
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            _buildRow(
              label: "row crossAxisAlignment(end):",
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
            _buildRow(
              label: "row crossAxisAlignment(center):",
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            _buildRow(
              label: "row crossAxisAlignment(stretch):",
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
            _buildRow(
              label: "row crossAxisAlignment(baseline):",
              crossAxisAlignment: CrossAxisAlignment.baseline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String label,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    final List<Widget> children = [];
    children.addAll(List.generate(
        10,
        (index) => Container(
              // width: 70 + Random().nextInt(10).toDouble(),
          width: 80,
          height: 30 + Random().nextInt(10).toDouble(),
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              child: Center(child: Text("$index")),
            )));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: SizedBox(width: 300, height: 18, child: Center(child: Text(label)))),
        SizedBox(
          height: 40,
          child: Container(
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              textBaseline: crossAxisAlignment == CrossAxisAlignment.baseline ? TextBaseline.alphabetic :null,
              children: children,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
