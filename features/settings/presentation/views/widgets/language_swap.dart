import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import '../../../../../core/local_database/cache_data.dart';
import '../../../../../core/local_database/cache_helper.dart';
import '../../../../../core/local_database/cache_helper_keys.dart';
import '../../../../../core/localization/translation_key_manager.dart';

class LanguageSwap extends StatelessWidget {
  const LanguageSwap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children:
        [
          ARLanguageItemBuilder(),
          ENLanguageItemBuilder(),
        ],
      ),
    );
  }
}

class ARLanguageItemBuilder extends StatelessWidget {
  const ARLanguageItemBuilder({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async
      {
        await CacheHelper.saveData(
            key: CacheHelperKeys.langKey,
            value: CacheHelperKeys.keyAR
        );              Get.updateLocale(TranslationKeyManager.localeAR);
        CacheData.lang = CacheHelperKeys.keyAR;
      },
      child: Container(
        width: 56,
        height: 30,
        decoration: BoxDecoration(
            color: CacheData.lang == CacheHelperKeys.keyEN ? ColorsManager.primaryColor : Colors.white,
            borderRadius:
            const BorderRadiusDirectional.only(
              topStart: Radius.circular(2.0),
              bottomStart: Radius.circular(2.0),
            )
        ),
        child: Container(
          width: 56,
          height: 30,
          decoration: BoxDecoration(
            color: CacheData.lang == CacheHelperKeys.keyAR ? ColorsManager.primaryColor : Colors.white,
            borderRadius:
            BorderRadius.circular(2.0),
          ),
          child: Center(
            child: Text(
              'عربي',
              style: CacheData.lang == CacheHelperKeys.keyAR ? StyleManager.langSwap.copyWith(height: 1.2)  : StyleManager.langSwap.copyWith(height: 1.2, color: ColorsManager.black),
            ),
          ),
        ),
      ),
    );
  }
}

class ENLanguageItemBuilder extends StatelessWidget {
  const ENLanguageItemBuilder({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async
      {

          await CacheHelper.saveData(
              key: CacheHelperKeys.langKey,
              value: CacheHelperKeys.keyEN
          );
          Get.updateLocale(TranslationKeyManager.localeEN);
          CacheData.lang = CacheHelperKeys.keyEN;
      },
      child: Container(
        width: 56,
        height: 30,
        decoration: BoxDecoration(
            color: CacheData.lang == CacheHelperKeys.keyEN ? ColorsManager.primaryColor : Colors.white,
            borderRadius:
            const BorderRadiusDirectional.only(
            topEnd: Radius.circular(2.0),
            bottomEnd: Radius.circular(2.0),
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            color:  CacheData.lang == CacheHelperKeys.keyEN ? ColorsManager.primaryColor : Colors.white,
            borderRadius:
            const BorderRadiusDirectional.only(
              topEnd: Radius.circular(2.0),
              bottomEnd: Radius.circular(2.0),
            ),
          ),
          child: Center(
            child: Text(
               'EN',
              style: CacheData.lang == CacheHelperKeys.keyEN ? StyleManager.langSwap : StyleManager.langSwap.copyWith(color: ColorsManager.black) ,
            ),
          ),
        ),
      ),
    );
  }
}
