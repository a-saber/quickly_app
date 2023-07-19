import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class JobItemBuilder extends StatelessWidget {
  const JobItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.formFieldFill,
          width: 1
        )
      ),
      height: 90,
      padding: const EdgeInsetsDirectional.only(
        start: 12,
        end: 14,
        top: 4
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text('مطلوب فني تكييفات',
          style: StyleManager.jobTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2.5,),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 29.0),
            child: Text('خبرة 1 سنة على الأقل لدوام كامل بمركز الرواد لصيانة الأجهزة الكهربائية',
              style: StyleManager.jobDesc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
            [
              Icon(
                Icons.watch_later_outlined,
                color: ColorsManager.primaryColor,
                size: 9.5,
              ),
              const SizedBox(width: 2,),
              Text('${TranslationKeyManager.since.tr} 1 ساعة ',
              style: StyleManager.newsDesc,
              ),
            ],
          )
        ],
      ),
    );
  }
}
