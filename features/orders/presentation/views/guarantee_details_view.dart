import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import 'widgets/guarantee_details_view_body.dart';

class GuaranteeDetailsView extends StatelessWidget {
  const GuaranteeDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
          child: Column(
        children: [
          const DefaultBar(title: TranslationKeyManager.guarantee),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,

              children: [
                const GuaranteeDetailsViewBody(),
                Container(
                  height: 81,
                  width: 81,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white
                  ),
                  padding: const EdgeInsetsDirectional.only(
                      start: 8,end: 8, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationKeyManager.orderNumber.tr,
                        style: StyleManager.orderNumber
                            .copyWith(color: ColorsManager.secondary,
                        height: 1.2),
                      ),
                      Center(
                        child: Text(
                          '2253 #',
                          style: StyleManager.orderNumber.copyWith(
                              fontSize: 19,height: 1.2),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
