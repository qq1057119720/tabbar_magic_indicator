import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar_magic_indicator/tabbar_magic_indicator.dart';

class BaseTabbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基本使用方法"),
      ),
      body:BaseTabarWidget(),
    );
  }
}

class BaseTabarWidget extends StatefulWidget {

  BaseTabarWidget();
  @override
  _BaseTabarState createState() =>
      _BaseTabarState();
}
class _BaseTabarState extends State<BaseTabarWidget> with
SingleTickerProviderStateMixin {
  TabController controller;
  var tabs = <MagicTab>[];
  _BaseTabarState();
  @override
  void initState() {
    super.initState();
    tabs.add(MagicTab(text: "标签1",tabHeight: 25,));
    tabs.add(MagicTab(text: "标签2",tabHeight: 25,));
    tabs.add(MagicTab(text: "标签3",tabHeight: 25,));
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> _buildTabarView(){
      List<Widget> list=new List();
      for (int i=0;i<tabs.length;i++) {
        list.add(Container(
          child: Text("标签${i+1}"),
        ));
      }
      return list;
    }
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                width: 230,
                child: MagicTabBar(
                  controller: controller,
                  tabs: tabs,
                  tabHeight: 25,
                  isScrollable: false,
                  indicatorSize: MagicTabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                  ),
                  indicator: MagicIndicator(
                      indicatorHeight: 2,
                      indicatorColor: Colors.red,
                      indicatorSize: MagicIndicatorSize.full
                  ),
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: MagicTabBarView(
                  controller: controller,
                  children: _buildTabarView(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
