import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class ExpandedFormField extends StatelessWidget {


  ExpandedFormField({
    super.key,
    required this.hint,
    this.enabled,
    required this.controller,
    this.icon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.onpress,
    this.onChange,
    this.validator,
  });

  String hint;
  bool? enabled;
  bool? isPassword;
  TextEditingController controller;
  Widget? icon;
  Widget? suffixIcon;
  TextInputType textInputType;
  void Function()? onpress;
  void Function(String)? onChange;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColorLight:ColorsManager.secondary ,
          primaryColor: ColorsManager.secondary,
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: ColorsManager.secondary,
            selectionHandleColor: ColorsManager.secondary,
          )
      ),
      child: TextFormField(
        enabled: enabled,
        validator: validator,
       // keyboardType: TextInputType.multiline,
        controller: controller,
        onChanged: onChange,
        style: StyleManager.hintFormField.copyWith(fontSize: 11,
            fontWeight:FontWeight.w700,height: 1.5),
        obscureText: isPassword!,
        obscuringCharacter: '●',
        cursorColor: ColorsManager.primaryColor,
        // expands:  true,
         maxLines: null,
        // minLines: null,


        decoration: InputDecoration(

            errorStyle: StyleManager.errorFormField,
            filled: true,
            fillColor: ColorsManager.formFieldFill,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            prefixIcon:icon == null ? SizedBox(): Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon!,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: suffixIcon,
            ),
            hintText: hint,
            disabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: ColorsManager.packageRowLight,
                )
            ) ,
            hintStyle: StyleManager.hintFormField,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: ColorsManager.packageRowLight,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: ColorsManager.packageRowLight,
                )
            ),
            focusedErrorBorder:  const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.errorFormField,
                )
            ),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.errorFormField,
                )
            ),
            contentPadding: const EdgeInsetsDirectional.only(start: 10,top: 7,bottom: 7,end: 10)
        ),
      ),
    );
  }
}
// if(icon != null)
// icon!,
// const SizedBox(width: 15,),

// if(suffixIcon != null)
//   suffixIcon!


/*
TextField(
        style: const TextStyle(
            fontSize: 16,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600
        ),
          enabled: enabled,
          onChanged: onChange,
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
            icon: iconData,
            contentPadding: const EdgeInsets.only(bottom: 17),
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 16,
                color: Colors.blueGrey.withOpacity(0.7),
              fontWeight: FontWeight.w600
            ),
            border: InputBorder.none,
            //prefixIcon: iconData,
          )
      )
 */
