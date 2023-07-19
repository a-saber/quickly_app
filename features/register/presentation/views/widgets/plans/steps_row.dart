import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/plans/step_item_builder.dart';

class StepsRow extends StatelessWidget {
  const StepsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(
          top: 10.0,
        right: 35,
        left: 35
      ),
      child:  Stack(
        children:
        [
           StepItemBuilder(
             order: 1,
              image: AssetsManager.registerStep1,
              label: "بيانات الشركة",
              alignment: Alignment.centerRight
          ),
          StepItemBuilder(
              order: 2,
              image: AssetsManager.registerStep2,
              label: "بيانات الشخصية",
              alignment: Alignment.center
          ),
          StepItemBuilder(
              order: 3,
              image: AssetsManager.registerStep3,
              label: "بيانات الاشتراك",
              alignment: Alignment.centerLeft,
            isChosen: true,
          ),

        ],
      ),
    );
  }
}


