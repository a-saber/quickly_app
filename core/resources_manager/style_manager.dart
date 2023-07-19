import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

abstract class StyleManager {
  static const TextStyle askHelp = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: ColorsManager.primaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle topBarLogin = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 23,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle choosePackage = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle packageLabel = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 17,
      color: ColorsManager.primaryColor,
      fontWeight: FontWeight.w800,
      height: 1.2);

  static const TextStyle packageHint = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 13,
    color: ColorsManager.secondary,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle packageDesc = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 9,
      color: ColorsManager.secondary,
      fontWeight: FontWeight.w900,
      wordSpacing: 0.000005,
      letterSpacing: 0.00005);

  static const TextStyle packageRow = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 11,
    color: ColorsManager.packageRowLight,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle packagePrice = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 21,
      color: Colors.white,
      fontWeight: FontWeight.w800,
      height: 1);
  static const TextStyle packageCurrency = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: ColorsManager.primaryColor,
      fontWeight: FontWeight.w800,
      height: 1.8);
  static const TextStyle partTitle = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 19,
    color: ColorsManager.black,
    fontWeight: FontWeight.w800,
    //height: 1.8
  );

  static const TextStyle stepLabelChosen = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      height: 1.2);
  static const TextStyle stepLabelUnChosen = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      color: ColorsManager.secondary,
      fontWeight: FontWeight.w900,
      height: 1.2);

  static const TextStyle stepNumberChosen = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      height: 1.2);
  static const TextStyle stepNumberUnChosen = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 16,
      color: ColorsManager.secondary,
      fontWeight: FontWeight.w900,
      height: 1.2);

  static const TextStyle planTitle = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 13.5,
      color: ColorsManager.primaryColor,
      fontWeight: FontWeight.w900,
      height: 1.2);

  static const TextStyle planActiveOption = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 13,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle planInActiveOption = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 13,
    color: ColorsManager.secondary,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle planRow = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: ColorsManager.packageRowLight,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle planFree = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeight.w900,
    // height: 1.2
  );

  static const TextStyle createAccount = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 24,
      color: ColorsManager.primaryColor,
      fontWeight: FontWeight.w800,
      height: 1.9);

  static const TextStyle sendCode = TextStyle(
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: ColorsManager.primaryColor
  );

  static const TextStyle hintFormField = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: ColorsManager.secondary,
  );

  static const TextStyle countryCodeFormField = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorsManager.secondary,
     // height: 1.2
  );

  static const TextStyle textFormField = TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: ColorsManager.primaryColor,
    //letterSpacing: 1.5,
    //height: 1.3
  );

  static const TextStyle sendCodeButton = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w600,
   //   height: 1.9
  );

  static const TextStyle resendCode = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    color: ColorsManager.secondary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle timeToResend = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 15,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle confirmButton = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    //height: 1
  );
  static const TextStyle codeNumber =
      TextStyle(
          fontFamily: 'Cairo',
          color: ColorsManager.black,
          fontSize: 18,
        fontWeight: FontWeight.w600,

      );

  static const TextStyle errorFormField =
      TextStyle(
          fontFamily: 'Cairo',
          color: ColorsManager.errorFormField,
          fontSize: 10,
        fontWeight: FontWeight.w600,

      );

  static const TextStyle snackBarError =
      TextStyle(
          fontFamily: 'Cairo',
          color: ColorsManager.primaryColor,
          fontSize: 15,
        fontWeight: FontWeight.w600,

      );

  static const TextStyle langSwap =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,

  );

  static const TextStyle homeAppBarTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle changeLang =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle settingOptionItem =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle secretaryNumber =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle delete =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle secretaryName =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle rateNumber =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.yellow,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle dropDown =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle paymentMethods =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.black,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle profile =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle personalData =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle personalDataComments =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle personalDataCommentsNumber =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle profileName =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.2
  );

  static const TextStyle profileData =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle emailConfirmed =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.green,
    fontSize: 8,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle commentOwnerName =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.2
  );

  static const TextStyle sinceTime =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle gender =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle itemBar =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle engineerName =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle regionDetermine =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle timeNumber =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.packageRowLight,
    fontSize: 23,
    fontWeight: FontWeight.w700,
    height: 1.2
  );

  static const TextStyle timeUnit =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.packageRowLight,
    fontSize: 16,
    fontWeight: FontWeight.w700,
      height: 1.2

  );

  static const TextStyle orderNumber =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle orderLocation =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle remindTime =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 8,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle orderDesc =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 8,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle guaranteePeriod =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle newsTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle newsDesc =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle newsDetailsTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle newsDetailsDesc =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle createJobBTN =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle jobTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle jobDesc =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );


  static const TextStyle jopDetailsTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle jopDetailsSubTitle =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.primaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle jobDetailsDesc =
  TextStyle(
    fontFamily: 'Cairo',
    color: ColorsManager.secondary,
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );






}
