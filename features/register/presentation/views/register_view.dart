import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      backgroundColor: ColorsManager.primaryColor,
      body: SafeArea(child: RegisterViewBody()),
    );
  }
}
