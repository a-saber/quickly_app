import 'package:flutter/material.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/packages/sliding_packages.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/top_bar/register_top_bar.dart';

import '../../../../../core/resources_manager/delay_manager.dart';
import 'packages/packages_view.dart';
import 'parts/parts_view.dart';
import 'plans/plans_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}
late AnimationController animationController;
late Animation<Offset> slidingAnimation;
class _RegisterViewBodyState extends State<RegisterViewBody> with SingleTickerProviderStateMixin{




  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(

        children:
        [
          TopBar(),
          //SlidingPackages(slidingAnimation: slidingAnimation)

          //PartsView()
          PlansView()
        ],
      ),
    );
  }
  void initAnimation()
  {
    animationController = AnimationController(
        vsync: this,
        duration: DelayManager.durationSplashAnimation,
    );
    slidingAnimation = DelayManager.tweenSplashAnimation
        .animate(animationController);

  }
}
