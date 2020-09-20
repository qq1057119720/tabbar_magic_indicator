# tabbar


## 运行效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200917215018414.gif#pic_center)


## 使用说明
tabbar_magic_indicator是结合官方的tabbar来做的一些自定义扩展，保留了系统的Tabbar所有功能。

1. 添加依赖
```
dependencies:
  tabbar_magic_indicator: ^0.0.2
```

2. 安装

```
$ flutter pub get
```

3. 导入

在需要使用tabbar的页面导入：

```
import 'package:tabbar_magic_indicator/tabbar_magic_indicator.dart';
```

实例代码：

```
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

```

```
/**
    const MagicTabBar({
    Key key,
    @required this.tabs,//显示的标签内容，一般使用Tab对象,也可以是其他的Widget
    this.controller,//TabController对象
    this.isScrollable = false,//是否可滚动
    this.indicatorColor,//指示器颜色
    this.indicatorWeight = 2.0,//指示器高度
    this.indicatorPadding = EdgeInsets.zero,//底部指示器的Padding
    this.indicator,//指示器decoration，例如边框等
    this.indicatorSize,//指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
    this.labelColor,//选中label颜色
    this.labelStyle,//选中label的Style
    this.labelPadding,//每个label的padding值
    this.unselectedLabelColor,//未选中label颜色
    this.unselectedLabelStyle,//未选中label的Style
    this.tabHeight=46,//tabbar高度
    }) : assert(tabs != null),
    assert(isScrollable != null),
    assert(indicator != null || (indicatorWeight != null && indicatorWeight > 0.0)),
    assert(indicator != null || (indicatorPadding != null)),
    super(key: key);
 */

```

```
  const MagicIndicator(
      {@required this.indicatorHeight,//indicator 高度
      @required this.indicatorColor,//indicator 颜色
      @required this.indicatorSize,//indicator样式
       this.radius=0//indicator圆角大小
       });
```

MagicTabBar 以及MagicTab对应的是系统的TabBar以及Tab，基本功能一致，只是多了一个可以改变Tabbar高度的字段tabHeight，tabHeight默认值与系统的TabBar一致为46。如果是想改变Tabbar高度，则MagicTabBar 和MagicTab都需要对tabHeight进行赋值。

其中：

```
   indicator: MagicIndicator(
                      indicatorHeight: 2,
                      indicatorColor: Colors.red,
                      indicatorSize: MagicIndicatorSize.full 
                  ),
```

MagicIndicator 是定义Tabbar indicator 的样式。通过indicatorSize来控制indicator展示：

```
enum MagicIndicatorSize {
  tiny,//下换线样式，默认宽度
  normal,//下划线样式,宽度跟随Tab文字长度
  full,//下划线样式，宽度跟随Tab宽度
  round,//圆角样式，宽度跟随Tab宽度
}

```



