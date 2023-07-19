import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_check_box.dart';
import 'package:quickly_app/core/core_widgets/profile_drop_down.dart';
import 'package:quickly_app/core/core_widgets/profile_form_field.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class ProfileBottomData extends StatefulWidget {
  const ProfileBottomData({Key? key}) : super(key: key);

  @override
  State<ProfileBottomData> createState() => _ProfileBottomDataState();
}

class _ProfileBottomDataState extends State<ProfileBottomData> {
  String? government;
  bool? male;
  var region = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();

  @override
  void initState() {
    government = 'government 1';
    male = true;
    region.text = 'فيصل';
    phone.text = '01004383942';
    email.text = 'ahs629862@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(17.0),
              topLeft: Radius.circular(17.0),
            )),
        padding: const EdgeInsets.only(
            right: 17,
            left: 17,
            top: 34),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children:
                [
                  SizedBox(
                    width: 110,
                      child: Text(TranslationKeyManager.government.tr,
                      textAlign: TextAlign.start,
                          style: StyleManager.profileData)
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: ProfileDropDown(
                          value: government,
                          onChanged: (val) {
                            // government = val;
                            // setState(() {});
                          },
                          items: const [
                            'government 1',
                            'government 2',
                            'government 3',
                            'government 4'
                          ],
                          hint: '',
                      ),
                    ),
                  ),
                ],
              ),
               const SizedBox(height: 14,),
               DataItemBuilder(controller: region, text: TranslationKeyManager.region),
              const SizedBox(height: 14,),
              DataItemBuilder(
                controller: phone,
                text: TranslationKeyManager.phone,
                suffix: Text('20+',
                  style: StyleManager.countryCodeFormField.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 14,),
              DataItemBuilder(
                  controller: email,
                  text: TranslationKeyManager.email,
                suffix: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Text(TranslationKeyManager.confirmed.tr,style: StyleManager.emailConfirmed,),
                      SizedBox(width: 5,),
                      Icon(Icons.check_circle, color: ColorsManager.green, size: 14,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22,),
              Row(
                children:
                [
                  SizedBox(
                    width: 110,
                    child: Text(TranslationKeyManager.gender.tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: StyleManager.profileData,),
                  ),
                  DefaultCheckBox(value: male!),
                  SizedBox(width: 10,),
                  Text(TranslationKeyManager.male.tr,style: StyleManager.gender),
                  SizedBox(width: 35,),
                  DefaultCheckBox(value: !male!),
                  SizedBox(width: 10,),
                  Text(TranslationKeyManager.female.tr,style: StyleManager.gender,),


                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}

class DataItemBuilder extends StatelessWidget {
  const DataItemBuilder({
    Key? key,
  required this.controller,
  required this.text,
  this.suffix,

  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        SizedBox(
            width: 110,
            child: Text(text.tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            style: StyleManager.profileData,),
        ),
        Expanded(
          child: SizedBox(
            height: 30,
            child: ProfileFormField(
              enabled: false,
                hint: '',
                controller: controller,
            suffixIcon: suffix ?? const SizedBox(),
            ),
          ),
        )

      ],
    );
  }
}
