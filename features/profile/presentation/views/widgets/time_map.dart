import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class TimeMap extends StatelessWidget {
  const TimeMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Stack(
        children:
        [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TranslationKeyManager.guaranteeStart.tr,
                  style: StyleManager.orderLocation,),
                Text(TranslationKeyManager.guaranteeEnd.tr,
                  style: StyleManager.orderLocation,),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsManager.secondary,
                  radius: 3.5,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: ColorsManager.secondary,
                  ),
                ),

                CircleAvatar(
                  radius: 31,
                  backgroundColor: ColorsManager.packageRowLight,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorsManager.formFieldFill,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(TranslationKeyManager.remainderOfPeriod.tr,
                        style: StyleManager.remindTime.copyWith(fontSize: 6,height: 1.2),),
                        const SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('8',style: StyleManager.guaranteePeriod.copyWith(
                              fontSize: 15,
                                height: 1.2
                            ),),
                            Text('شهور',style: StyleManager.guaranteePeriod.copyWith(
                                fontSize: 10,
                                height: 1.2
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 1,
                    color: ColorsManager.secondary,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: ColorsManager.secondary,
                  radius: 3.5,
                ),
              ],
            ),
          ),

          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('29 اكتوبر 2020',
                    style: StyleManager.orderNumber.copyWith(fontSize: 9),),
                  Text('29 اكتوبر 2021',
                    style: StyleManager.orderNumber.copyWith(fontSize: 9),),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
