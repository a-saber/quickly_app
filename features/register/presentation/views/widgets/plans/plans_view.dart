import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';
import 'package:quickly_app/features/register/data/parts/parts.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/parts/part_item_builder.dart';

import '../../../../data/plans/plans.dart';
import 'plan_item_builder.dart';
import 'steps_row.dart';


class PlansView extends StatelessWidget {
  const PlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 38.0,right: 17,left: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          const StepsRow(),

          const SizedBox(height: 19,),
          Column(
            children: [
              Row(
                children:
                [
                  PlanItemBuilder(plan: plans[0]),
                  const SizedBox(width: 15,),
                  PlanItemBuilder(plan: plans[1]),
                ],
              ),
              const SizedBox(height: 17,),
              Row(
                children:
                [
                  PlanItemBuilder(plan: plans[2]),
                  const SizedBox(width: 15,),
                  PlanItemBuilder(plan: plans[3]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 34,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 45),
            padding: const EdgeInsets.symmetric(vertical: 0),
            width: double.infinity,
            child: TextButton(
                onPressed: (){},
                child: const Text("إنشاء الحساب",
                  style: StyleManager.createAccount
                )),
          ),
          const SizedBox(height: 54,),

        ],
      ),
    );
  }
}
