import 'package:flutter/material.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/payment_methods/presentation/views/widgets/payment_methods_list_item_builder.dart';
import 'package:quickly_app/features/payment_methods/presentation/views/widgets/payment_methods_stack_forward.dart';

class PaymentMethodsStackBack extends StatelessWidget {
  const PaymentMethodsStackBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: ColorsManager.black,
              height: 60,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(17.0),
                      topLeft: Radius.circular(17.0),
                    )),
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
                //child: ,
              ),
            ),
          ],
        ),
        const PaymentMethodsStackForward()
      ],
    );
  }
}
