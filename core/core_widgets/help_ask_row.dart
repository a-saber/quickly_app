import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class HelpAskRow extends StatelessWidget {
  const HelpAskRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 15.0,
          left: 15.0,
          top: 15
      ),
      child: Row(
        children:
        [
          SvgPicture.asset(
            AssetsManager.askHelpQuestionIcon,
            height: 13.3,
            width: 13.3,
          ),
          const SizedBox(width: 3,),
          const Text(
            'طلب مساعدة',
            style: StyleManager.askHelp,
          ),
          const Spacer(),
          const Icon(Icons.arrow_back_ios_new,
            color: ColorsManager.primaryColor,
            size: 17,
          )
        ],
      ),
    );
  }
}
