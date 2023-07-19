import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
            children:
            [
              CachedNetworkImage(
                  imageBuilder: (context, imageProvider) =>
                      Transform.scale(
                          scale: 1.5,
                          child: Image(image: imageProvider)
                      ),
                  placeholder: (context, error) =>
                  const Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                  ),
                  fit: BoxFit.fill,
                  imageUrl:  'https://cloudfront.slrlounge.com/wp-content/uploads/2014/01/black-clothing-background-2.jpg',
                  errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.image_outlined))
              ),


              Transform.scale(
                scale: 1.5,
                child: Container(
                  // height: MediaQuery.of(context).size.height/2,
                  color: ColorsManager.black.withOpacity(0.5),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  DefaultBar(
                    title: TranslationKeyManager.news,
                    hasPop: false,
                  ),
                  const SizedBox(height: 65,),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 21.0),
                    child: Text('اخر أسعار موتور التلاجات الجديد 2020',
                    style: StyleManager.newsDetailsTitle,
                    ),
                  ),
                  const SizedBox(height: 11,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17.0),
                            topLeft: Radius.circular(17.0),
                          )),
                      padding: const EdgeInsets.only(
                          right: 17,
                          left: 17,
                          top: 8
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
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
                            ),
                            const SizedBox(height: 18.5,),
                            Text('''أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع


 أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار  أرتفاع أسعار الأجهزة الكهربائية هذا العام أرتفاع أسعار الأجهزة الكهربائية هذا العام
                            ''',
                            style: StyleManager.newsDetailsDesc,)

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
