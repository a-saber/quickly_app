import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

class DefaultCheckBox extends StatelessWidget {
  const DefaultCheckBox({Key? key,
    required this.value
  }) : super(key: key);

  final bool value;
  @override
  Widget build(BuildContext context) {
    if (value)
    {
      return const Icon(Icons.check_circle,size: 17, color: ColorsManager.primaryColor,);
    }
    else
    {
      return SvgPicture.asset(AssetsManager.checkBoxEmpty);
    }
  }
}
