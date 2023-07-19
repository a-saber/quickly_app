import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/default_button.dart';
import 'package:quickly_app/core/core_widgets/expanded_form_field.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class CreateJobView extends StatelessWidget {
  const CreateJobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Column(
          children:
          [
            const DefaultBar(
              title: TranslationKeyManager.createJob,
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
                    top: 28),
                child: SingleChildScrollView(
                  child: Column(
                    children:
                    [

                      // todo complete

                      ExpandedFormField(
                        //enabled: false,
                        hint: TranslationKeyManager.jobDesc.tr,
                        controller: TextEditingController(),
                      ),

                      const SizedBox(height: 39,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: DefaultButton(text: TranslationKeyManager.create.tr,
                          style: StyleManager.createJobBTN,
                          background: ColorsManager.primaryColor,
                          onPressed: () {},
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
/*
 Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: DefaultButton(text: TranslationKeyManager.createJob.tr,
                            style: StyleManager.createJobBTN,
                            background: ColorsManager.primaryColor,
                            onPressed: () {},
                          height: 35,
                        ),
                      ),
 */