import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garudahacks/src/views/widgets/tab/custom_tab_indicator.dart';
import 'package:garudahacks/src/views/widgets/tab/tab_bar_item.dart';
// TODO : Fix this
class CustomTabBar extends StatefulWidget {
  final List<TabBarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;

  CustomTabBar({
    Key key,
    @required this.items,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<CustomTabBar> {

  List<TabBarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return new TabBar(
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: CustomTabIndicator(
        indicatorHeight: 35.0,
        indicatorColor: Colors.redAccent,
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
      tabs: items.map((e) {
        Tab(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
              ),
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: Colors.black,
                ),
                child: Icon(e.icon),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: DefaultTextStyle.merge(
                    style: TextStyle(color: e.color),
                    child: Text("Home")
                ),
              )
            ],
          ),
        );
      }).toList()
    );
  }

}