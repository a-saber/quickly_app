import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class DelayManager
{
  // splash body
  static const Duration durationSplashAnimation = Duration(seconds: 1);
  static Tween<Offset> tweenSplashAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -2),
  );

  // splash to home
  static const Duration durationSplashToHome = Duration(milliseconds: 1500);
  static const Transition transitionSplashToHome = Transition.fadeIn;
  static const int timeTransitionSplashToHome = 1;
  static const Duration durationTransitionSplashToHome = Duration(seconds: timeTransitionSplashToHome);

  // forgot Password
  static const Transition transitionRegister = Transition.downToUp;
  static const Duration durationTransitionRegister = Duration(milliseconds: 500);



}