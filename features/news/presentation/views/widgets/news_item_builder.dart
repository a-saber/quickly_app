import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class NewsItemBuilder extends StatelessWidget {
  const NewsItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.formFieldFill,
          width: 1
        )
      ),
      height: 93,
      padding: EdgeInsets.symmetric(horizontal: 4,),
      child: Row(
        children:
        [
          CachedNetworkImage(
              imageBuilder: (context, imageProvider) =>
                  Container(
                    height: 87,
                    width: 83,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: ColorsManager.secondary,
                        width: 1
                      ),
                      image: DecorationImage(image: imageProvider,
                          fit: BoxFit.cover)
                    ),
                  ),
              placeholder: (context, error) =>
              SizedBox(
                height: 87,
                width: 83,
                child: const Icon(
                  Icons.image_outlined,
                  color: Colors.grey,
                ),
              ),
              fit: BoxFit.fill,
              imageUrl: 'https://cloudfront.slrlounge.com/wp-content/uploads/2014/01/black-clothing-background-2.jpg',
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.image_outlined))
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SizedBox(height: 2,),
                Text('أرتفاع أسعار الأجهزة الكهربائية هذا العام',
                style: StyleManager.newsTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3.5,),
                Text('أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام',
                  style: StyleManager.newsDesc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
          ),
        ],
      ),
    );
  }
}
