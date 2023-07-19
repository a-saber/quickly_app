import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import 'widgets/payment_methods_view_body.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(child: PaymentMethodsViewBody()),
    );
  }
}
