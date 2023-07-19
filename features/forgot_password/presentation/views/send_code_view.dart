import 'package:flutter/material.dart';

import 'widgets/send_code_view_body.dart';

class SendCodeView extends StatelessWidget {
  const SendCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SendCodeViewBody(),
    );
  }
}
