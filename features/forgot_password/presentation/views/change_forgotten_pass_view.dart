import 'package:flutter/material.dart';

import 'widgets/change_forgotten_pass_view_body.dart';

class ChangeForgottenPassView extends StatelessWidget {
  const ChangeForgottenPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ChangeForgottenPassViewBody(),
    );
  }
}
