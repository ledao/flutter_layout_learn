import 'package:flutter/material.dart';
import 'package:learn_layout/flex_layout_page.dart';
import 'package:learn_layout/line_layout_page.dart';
import 'package:learn_layout/positioned_layout_page.dart';
import 'package:learn_layout/scroll_layout_page.dart';
import 'package:learn_layout/stack_layout_page.dart';
import 'package:learn_layout/wrap_layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '布局展示',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          LineLayoutWidget(),
          FlexLayoutPage(),
          WrapLayoutPage(),
          ScrollLayoutPage(),
          StackLayoutPage(),
          PositionedLayoutWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(label: "线性", icon: Icon(Icons.layers_outlined)),
          BottomNavigationBarItem(label: "弹性", icon: Icon(Icons.layers_outlined)),
          BottomNavigationBarItem(label: "流式", icon: Icon(Icons.layers_outlined)),
          BottomNavigationBarItem(label: "滚动", icon: Icon(Icons.layers_outlined)),
          BottomNavigationBarItem(label: "层叠", icon: Icon(Icons.layers_outlined)),
          BottomNavigationBarItem(label: "定位", icon: Icon(Icons.layers_outlined)),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }
}

