import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import 'secretaries_list_view.dart';


class SecretariesViewBody extends StatelessWidget {
  const SecretariesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        const DefaultBar(title: TranslationKeyManager.secretary),
        const SizedBox(height: 35,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Row(
            children:
            [
              SvgPicture.asset(AssetsManager.iconPerson),
              const SizedBox(width: 12,),
              Text(TranslationKeyManager.secretaryNumber.tr, style: StyleManager.changeLang,),
              const Spacer(),
              const Text('3', style: StyleManager.secretaryNumber,)
            ],
          ),
        ),
        const SizedBox(height: 12,),
        const Expanded(child: SecretariesListView())
      ],
    );
  }
}
