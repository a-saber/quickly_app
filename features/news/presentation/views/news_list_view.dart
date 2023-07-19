import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/news/presentation/views/widgets/news_item_builder.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.black,
        body: SafeArea(
          child: Column(
            children:
            [
              DefaultBar(
                  title: TranslationKeyManager.news,
                  icon: SvgPicture.asset(AssetsManager.newsAppBar,),
                  onPressed: (){},
                hasPop: false,
              ),
              const SizedBox(height: 28,),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(17.0),
                          topLeft: Radius.circular(17.0),
                        )
                    ),
                    padding: const EdgeInsets.only(
                        right: 14,
                        left: 14,
                        top: 38),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index)=> Column(
                          children:
                          [
                            NewsItemBuilder(),
                            const SizedBox(height: 13,)
                          ],
                        ),
                      itemCount: 3,
                    ),
                ),
              )

            ],
          ),
        )
    );
  }
}
