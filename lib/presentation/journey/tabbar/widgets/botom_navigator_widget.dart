import 'package:dating_app/presentation/journey/tabbar/tabbar_item.dart';
import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final TabController controller;
  const BottomNavigatorWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF3F3F3),
      height: 48,
      child: SafeArea(
        child: TabBar(
            labelColor: const Color(0xffDB353A),
            unselectedLabelColor: const Color(0xffA2AEBD),
            indicatorColor: const Color(0xffDB353A),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0xffE94057), width: 2.0),
              insets: EdgeInsets.fromLTRB(24, 0.0, 24, 45),
            ),
            isScrollable: false,
            controller: controller,
            tabs: List.generate(tabBarItem.values.length, (index) {
              return tabItem(tabBarItem.values[index]);
            })),
      ),
    );
  }

  Widget tabItem(tabBarItem item) {
    return Icon(
      item.icon(),
      size: 20,
    );
  }
}
