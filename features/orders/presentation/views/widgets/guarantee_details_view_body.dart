import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_rating.dart';
import 'package:quickly_app/core/core_widgets/expanded_form_field.dart';
import 'package:quickly_app/core/core_widgets/profile_form_field.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/profile/presentation/views/widgets/time_map.dart';

class GuaranteeDetailsViewBody extends StatelessWidget {
  const GuaranteeDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(17.0),
                    topLeft: Radius.circular(17.0),
                  )),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 38),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          TranslationKeyManager.makeComplaint.tr,
                          style: StyleManager.orderLocation
                              .copyWith(color: ColorsManager.yellow,fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(width: 4,),
                        SvgPicture.asset(
                            AssetsManager.askHelpQuestionIcon,
                        color: ColorsManager.yellow, height: 11, width: 11,
                        )
                      ],
                    ),
                    Text(
                      TranslationKeyManager.guaranteeInfo.tr,
                      style: StyleManager.orderLocation,
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(TranslationKeyManager.guaranteePeriod.tr,
                        style: StyleManager.guaranteePeriod,),
                        const SizedBox(width: 8,),
                        Container(
                          width: 55,
                          height: 17,
                          decoration: BoxDecoration(
                              color: ColorsManager.likePrimary.withOpacity(0.39),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child: Text('1 سنة',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: ColorsManager.primaryColor,
                                fontFamily: 'Cairo',
                                height: 1.4
                              ),),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),

                    const TimeMap(),

                    const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 105),
                      height: 1,
                      color: ColorsManager.packageRowLight,
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      TranslationKeyManager.problemInfo.tr,
                      style: StyleManager.orderLocation,
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children:
                      [
                        SvgPicture.asset(AssetsManager.console),
                        const SizedBox(width: 3,),
                        Text(TranslationKeyManager.deviceType.tr,
                        style: StyleManager.orderNumber.copyWith(
                            fontSize: 13
                        ),),
                        const SizedBox(width: 4,),
                        Text('ديب فريزر',style: StyleManager.orderNumber.copyWith(
                            fontSize: 13,
                          color: ColorsManager.black
                        ),),
                        const SizedBox(width: 26,),
                        SvgPicture.asset(AssetsManager.console),
                        const SizedBox(width: 3,),
                        Text(TranslationKeyManager.deviceBrand.tr,
                          style: StyleManager.orderNumber.copyWith(
                              fontSize: 13
                          ),),
                        const SizedBox(width: 4,),
                        Text('كريازي',style: StyleManager.orderNumber.copyWith(
                            fontSize: 13,
                            color: ColorsManager.black),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12,),
                    Text(TranslationKeyManager.apparentDefects.tr,
                      style: StyleManager.orderNumber
                    ),
                    const SizedBox(height: 5,),

                    ExpandedFormField(
                      enabled: false,
                      hint: '',
                      controller: TextEditingController(text:'عطل في الديب فريزر . بيكون تلج كتير ومش بيتلج أي اكل فيه عطل في الديب فريزر . بيكون تلج كتير ومش بيتلج أي اكل فيه' ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children:
                      [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                        radius: 20.5,
                                        backgroundImage: imageProvider,
                                      ),
                                  placeholder: (context, error) =>
                                  const Icon(
                                    Icons.image_outlined,
                                    color: Colors.grey,
                                  ),
                                  fit: BoxFit.fill,
                                  imageUrl: 'https://cloudfront.slrlounge.com/wp-content/uploads/2014/01/black-clothing-background-2.jpg',
                                  errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.image_outlined))
                              ),
                              CircleAvatar(
                                radius: 5.3,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 4.8,
                                  backgroundColor: ColorsManager.greenLight,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 2,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(TranslationKeyManager.chargeDAffaires.tr,
                                  style: StyleManager.orderLocation.copyWith(height: 1.2),),

                                  const SizedBox(height: 2,),

                                  Text('محمد مصطفى',
                                    style: StyleManager.orderNumber.copyWith(
                                        fontSize: 13,height: 1.2
                                    ),),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2,),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                DefaultRating(rate: 4,
                                  fullColor: ColorsManager.yellow,
                                ),
                                const SizedBox(width: 3,),
                                Text('4+', style: StyleManager.rateNumber.copyWith(

                                    height: 1),)
                              ],
                            ),


                          ],
                        )

                      ],
                    )



                  ],
                ),
              )),
        ),
      ],
    );
  }
}
