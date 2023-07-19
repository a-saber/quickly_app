import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';


class MyTabBarView extends StatelessWidget {
  const MyTabBarView({Key? key,
    required this.length,
    required this.tabs,
    required this.onTab,
    this.isScrollable = false,
  }) : super(key: key);
  final int length;
  final List<Widget> tabs;
  final void Function(int)? onTab;
  final bool isScrollable;
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: length,
      child: TabBar(
        padding: const EdgeInsets.only(right: 5),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.only(left: 10,right: 10),
        indicatorColor: ColorsManager.primaryColor,
        isScrollable: isScrollable,
        onTap: onTab,
        tabs: tabs,
        indicatorWeight: 3,
      ),
    );
  }
}
