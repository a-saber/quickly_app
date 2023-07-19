import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/expanded_form_field.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class JobsDetailsView extends StatelessWidget {
  const JobsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              DefaultBar(
                title: TranslationKeyManager.jobs,
                hasPop: false,
              ),
              const SizedBox(height: 44,),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 21.0,end: 13),
                child: Row(
                  children:
                  [
                    SvgPicture.asset(AssetsManager.besideJop),
                    const SizedBox(width: 9,),
                    Expanded(
                      child: Text('فني تكييفات',
                        style: StyleManager.jopDetailsTitle,
                      ),
                    ),
                    //Spacer(),
                    const SizedBox(width: 9,),
                    Column(
                      children:
                      [
                        SvgPicture.asset(AssetsManager.deleteJop),
                        Text(TranslationKeyManager.deleteJob.tr,
                          style: StyleManager.newsDesc.copyWith(
                            color: ColorsManager.primaryColor
                          ),
                        ),
                      ],
                    )
                  ],
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
                  padding: const EdgeInsetsDirectional.only(
                      start: 20,
                      end: 17,
                      top: 11
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Text( TranslationKeyManager.yearsOfExperience.tr,
                              style: StyleManager.jopDetailsSubTitle,
                            ),
                            const SizedBox(width: 14,),
                            Text( '1',
                              style: StyleManager.jobDetailsDesc.copyWith(
                                fontSize: 12,
                                color: ColorsManager.black
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Text( 'سنة',
                              style: StyleManager.jobDetailsDesc.copyWith(
                                  fontSize: 12,
                                  color: ColorsManager.secondary
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 11,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Text( TranslationKeyManager.phone.tr,
                              style: StyleManager.jopDetailsSubTitle,
                            ),
                            const SizedBox(width: 14,),
                            Text( '0105632457',
                              style: StyleManager.jobDetailsDesc.copyWith(
                                  fontSize: 12,
                                  color: ColorsManager.black
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Text( '+20',
                              style: StyleManager.jobDetailsDesc.copyWith(
                                  fontSize: 12,
                                  color: ColorsManager.secondary
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 11,),
                        Text( TranslationKeyManager.jobDesc.tr,
                          style: StyleManager.jopDetailsSubTitle,
                        ),
                        const SizedBox(height: 4,),
                        ExpandedFormField(
                          enabled: false,
                          hint: '',
                          controller: TextEditingController(text:'خبرة 1 سنة على الأقل لدوام كامل بمركز الرواد لصيانة الأجهزة الكهربائية خبرة 1 سنة على لدوام كامل بمركز الرواد الأجهزة بمركز الرواد لصيانة الأجهزة الكهربائية خبرة 1 سنة الأقل لدوام كامل الرواد لصيانة الأجهزة الكهربائية خبرة 1 سنة على كامل بمركز الرواد الأجهزة الكهربائية  خبرة 1 على الأقل لدوام كامل بمركز الرواد لصيانة الأجهزة الكهربائية   خبرة 1 سنة على الأقل لدوام كامل بمركز الرواد لصيانة الأجهزة الكهربائية' ),
                        ),




                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
