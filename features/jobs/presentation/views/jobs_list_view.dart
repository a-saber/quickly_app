import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/default_button.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import 'widgets/job_item_builder.dart';

class JobListView extends StatelessWidget {
  const JobListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.black,
        body: SafeArea(
          child: Column(
            children:
            [
              const DefaultBar(
                title: TranslationKeyManager.jobs,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Column(
                                children:
                                [
                                  JobItemBuilder(),
                                  const SizedBox(height: 19,)
                                ],
                              ),
                          itemCount: 13,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: DefaultButton(text: TranslationKeyManager.createJob.tr,
                            style: StyleManager.createJobBTN,
                            background: ColorsManager.primaryColor,
                            onPressed: () {},
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        )
    );
  }
}
