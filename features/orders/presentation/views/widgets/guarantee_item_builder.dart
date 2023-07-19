import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class GuaranteeItemBuilder extends StatelessWidget {
  const GuaranteeItemBuilder({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: ColorsManager.formFieldFill,
          border: Border.all(
              width: 0.5,
              color: ColorsManager.packageRowLight
          )
      ),
      padding: const EdgeInsetsDirectional.only(
        top: 5,
        bottom: 8,
        start: 22,
        end: 5,
      ),
      child: Stack(
        children: [
          Row(
            children:
            [
              Column(
                children: [
                  Text('12',style: StyleManager.timeNumber,),
                  Text('شهر',style: StyleManager.timeUnit,),
                ],
              ),
              SizedBox(width: 24,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text("${TranslationKeyManager.orderNumber.tr} 123456 #",
                      style: StyleManager.orderNumber,
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                          color: ColorsManager.secondary,
                        size: 10,),
                        SizedBox(width: 3,),
                        Text('القاهرة, الجيزة',
                          style: StyleManager.orderLocation,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children:
                      [
                        Text(TranslationKeyManager.guaranteeFor.tr,
                          style: StyleManager.orderLocation,
                        ),
                        const SizedBox(width: 5,),
                        Container(
                          width: 45,
                          decoration: BoxDecoration(
                            color: ColorsManager.yellow.withOpacity(0.29),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text('1 سنة',
                            style: StyleManager.orderDesc.copyWith(color: ColorsManager.primaryColor),),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text("${TranslationKeyManager.deviceType.tr} : ",
                          style: StyleManager.orderLocation,
                        ),
                        Text("ديب فريزر",
                          style: StyleManager.orderLocation.copyWith(color: ColorsManager.primaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          false?
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SizedBox(
              width: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                [
                  Text(TranslationKeyManager.remainderOfPeriod.tr,
                    style: StyleManager.remindTime,
                  ),
                  SizedBox(
                    width: 57,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Icon(Icons.watch_later_outlined,
                          size: 10,
                          color: ColorsManager.primaryColor,),
                        SizedBox(width: 2,),
                        Text("5 شهور",
                          style: StyleManager.remindTime.copyWith(
                              color: ColorsManager.primaryColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          :
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
                  Icon(Icons.watch_later_outlined,
                    size: 10,
                    color: ColorsManager.primaryColor,),
                  SizedBox(width: 2,),
                  Text(TranslationKeyManager.periodFinished.tr,
                    style: StyleManager.remindTime
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
