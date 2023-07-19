import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/engineer/presentation/views/widgets/engineer_view_body.dart';


class EngineersView extends StatelessWidget {
  const EngineersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(child: EngineersViewBody()),
    );
  }
}
