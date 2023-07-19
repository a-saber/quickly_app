import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import 'widgets/secretaries_view_body.dart';

class SecretariesView extends StatelessWidget {
  const SecretariesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(child: SecretariesViewBody()),
    );
  }
}
