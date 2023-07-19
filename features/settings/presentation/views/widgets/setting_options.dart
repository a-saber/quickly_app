import 'package:flutter/material.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';

import '../../../../../core/resources_manager/assets_manager.dart';
import 'settings_option_item_builder.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17.0),
            topLeft: Radius.circular(17.0),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child:  const SingleChildScrollView(
        child: Column(
          children: [
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconPerson,
                text: TranslationKeyManager.secretary,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconPerson,
                text: TranslationKeyManager.engineer,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconTime,
                text: TranslationKeyManager.schedule,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconCreditCard,
                text: TranslationKeyManager.creditCards,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconSettingsLock,
                text: TranslationKeyManager.changePassword,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconAccept,
                text: TranslationKeyManager.termsConditions,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconInfo,
                text: TranslationKeyManager.knowAboutUs,
                widget: Scaffold()
            ),
            SettingOptionsItemBuilder(
                icon: AssetsManager.iconExplain,
                text: TranslationKeyManager.appExplain,
                widget: Scaffold()
            ),
          ],
        ),
      ),
    );
  }
}

