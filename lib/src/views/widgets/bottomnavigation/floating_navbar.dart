import 'package:flutter/material.dart';
import 'package:garudahacks/src/utils/constant.dart';
import 'package:garudahacks/src/views/widgets/bottomnavigation/floating_navbar_item.dart';

typedef Widget ItemBuilder(BuildContext context, FloatingNavBarItem items);

class FloatingNavBar extends StatefulWidget {
  final List<FloatingNavBarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;
  final ItemBuilder itemBuilder;

  FloatingNavBar({
    Key key,
    @required this.items,
    this.currentIndex,
    @required this.onTap,
    ItemBuilder itemBuilder,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = Colors.transparent,
    this.selectedItemColor = Colors.black,
    this.iconSize = 25.0,
    this.fontSize = 8.0,
    this.borderRadius = 20,
    this.itemBorderRadius = 20,
    this.unselectedItemColor = Colors.blueGrey,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            ),
        super(key: key);

  @override
  _FloatingNavBarState createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  List<FloatingNavBarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.grey.withOpacity(.5),
          blurRadius: 10.0,
          spreadRadius: 0.0,
          offset: Offset(
            5.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        ),
      ]),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                padding: EdgeInsets.only(bottom: 8, top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: widget.backgroundColor,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: items.map((item) {
                      return widget.itemBuilder(context, item);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val) onTap,
  List<FloatingNavBarItem> items,
  int currentIndex,
  Color selectedBackgroundColor,
  Color selectedItemColor,
  Color unselectedItemColor,
  Color backgroundColor,
  double fontSize,
  double iconSize,
  double itemBorderRadius,
  double borderRadius,
}) {
  return (BuildContext context, FloatingNavBarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: currentIndex == items.indexOf(item)
                      ? selectedBackgroundColor
                      : backgroundColor,
                  borderRadius: BorderRadius.circular(itemBorderRadius)),
              child: InkWell(
                onTap: () {
                  onTap(items.indexOf(item));
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  //max-width for each item
                  //24 is the padding from left and right
                  width: MediaQuery.of(context).size.width *
                          (100 / (items.length * 100)) -
                      20,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: Constant.PRIMARY_COLOR,
                        size: iconSize,
                      ),
                      Text(
                        '${item.title}',
                        style: TextStyle(
                          color: currentIndex == items.indexOf(item)
                              ? selectedItemColor
                              : unselectedItemColor,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
