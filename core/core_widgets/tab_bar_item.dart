
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({Key? key ,
    required this.label,
    required this.selected
  }) : super(key: key);

  final String label;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,left: 10,right: 10),
      child: Text(
        label.tr,
        style: selected?
        StyleManager.itemBar.copyWith(color: ColorsManager.primaryColor):
        StyleManager.itemBar,
        textAlign: TextAlign.center,
      ),
    );
  }
}