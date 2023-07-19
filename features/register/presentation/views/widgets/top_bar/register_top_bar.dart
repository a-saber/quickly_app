import 'package:flutter/material.dart';
import 'package:quickly_app/core/core_widgets/help_ask_row.dart';

import 'bar_login.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
        )
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          SizedBox(height: 20,),
          HelpAskRow(),
          SizedBox(height: 15,),
          BarLogin()
        ],
      ),
    );
  }
}
