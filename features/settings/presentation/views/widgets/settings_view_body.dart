import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/settings/presentation/views/widgets/setting_options.dart';

import 'language_swap.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        const DefaultBar(title: TranslationKeyManager.settings),
        const SizedBox(height: 35,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Row(
            children:
            [
              Text(TranslationKeyManager.changeLang.tr, style: StyleManager.changeLang,),
              const Spacer(),
              const LanguageSwap(),


            ],
          ),
        ),
        const SizedBox(height: 16,),
        const Expanded(child: SettingOptions())
      ],
    );
  }
}
