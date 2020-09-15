import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbar_magic_indicator/tabbar_magic_indicator.dart';

class ChangeHeightTabbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("调整tabbar高度"),
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
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red,
                      width: 1),
                  borderRadius:BorderRadius.all(Radius.circular(2.5)),
                ),
                child: MagicTabBar(
                  controller: controller,//可以和TabBarView使用同一个TabController
                  tabs: tabs,
                  tabHeight: 25,
                  isScrollable: false,
                  indicatorSize: MagicTabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                  ),
                  indicator: MagicIndicator( //it begins here
                      indicatorHeight: 25,
                      indicatorColor: Colors.red,
                      radius: 2.5,
                      indicatorSize: MagicIndicatorSize.round //3 different modes
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
