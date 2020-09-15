import 'package:flutter/material.dart';
import 'package:tabbar_example/base_tabbar_widget.dart';
import 'package:tabbar_example/change_height_tabbar_widget.dart';
import 'package:tabbar_example/round_tabbar_widget.dart';
import 'package:tabbar_magic_indicator/tabbar_magic_indicator.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: buildScaffold,),
    );
  }

  ///创建一个widget
  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAGIC TABBAR'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push( context,
                  MaterialPageRoute(builder: (_) {
                    return BaseTabbar();
                  }));
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: Text("基本使用方法"),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push( context,
                  MaterialPageRoute(builder: (_) {
                    return ChangeHeightTabbar();
                  }));
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: Text("修改tabbar高度"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push( context,
                  MaterialPageRoute(builder: (_) {
                    return RoundTabbar();
                  }));
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: Text("圆角指示器"),
            ),
          )
        ],
      ),
    );
  }

}
