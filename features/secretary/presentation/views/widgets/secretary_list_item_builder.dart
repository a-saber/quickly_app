import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class SecretaryListItemBuilder extends StatelessWidget {
  const SecretaryListItemBuilder({Key? key}) : super(key: key);

  
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
            const Text('علي عبد الحميد', style: StyleManager.secretaryName,),
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
