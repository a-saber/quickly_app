import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import '../../../../../core/core_widgets/default_rating.dart';

class EngineerListItemBuilder extends StatelessWidget {
  const EngineerListItemBuilder({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://cdn1.naekranie.pl/media/cache/article-cover/2018/02/maxresdefault-2.jpg'),
              backgroundColor: Colors.transparent,
              radius: 25,
            ),
            const SizedBox(width: 8,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('علي عبد الحميد', style: StyleManager.secretaryName,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   // MyRating(),
                    DefaultRating(rate: 3.5, readOnly: true),
                    SizedBox(width: 4,),
                    Text('3+', style: StyleManager.rateNumber,)
                  ],
                ),
              ],
            ),
            const Spacer(),
            MaterialButton(
              height: 24,
              onPressed: (){},
              color: ColorsManager.red,
              child: Text(TranslationKeyManager.delete.tr, style: StyleManager.delete,),
            )

          ],
        ),
        const SizedBox(height: 23,)
      ],
    );
  }
}
