import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class BarLogin extends StatelessWidget {
  const BarLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children:
      [
        Icon(Icons.keyboard_arrow_down_rounded, size: 35, color: ColorsManager.primaryColor,),
        SizedBox(width: 5,),
        Text(
          'تسجيل الدخول',
          style: StyleManager.topBarLogin,
          softWrap: false,
        ),
      ],
    );
  }
}
