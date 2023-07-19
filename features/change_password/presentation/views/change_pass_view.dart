import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import 'widgets/change_pass_view_body.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(child: ChangePassViewBody()),
    );
  }
}
