import 'package:flutter/material.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/features/payment_methods/presentation/views/widgets/payment_methode_stack_back.dart';



class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children:
      [
        DefaultBar(title: TranslationKeyManager.determinePaymentMethods),
        SizedBox(height: 27,),
        Expanded(child: PaymentMethodsStackBack())
      ],
    );
  }
}
