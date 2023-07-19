import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';

class SettingOptionsItemBuilder extends StatelessWidget {
  const SettingOptionsItemBuilder({
    Key? key,
    required this.icon,
    required this.text,
    required this.widget,
  }) : super(key: key);

  final String icon;
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ()
          {
            Get.to(()=>Scaffold(appBar: AppBar(),), transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
          },
          child: Row(
            children: [
              SizedBox(
                width :15,
                  child: SvgPicture.asset(icon, width: 15,)),
              const SizedBox(
                width: 10,
              ),
              Text(
                text.tr,
                style: StyleManager.settingOptionItem,
              )
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.75, color: ColorsManager.packageRowLight)
          ),
        ),
        const SizedBox(height: 20,),

      ],
    );
  }
}
