import 'package:flutter/material.dart';

import '../resources_manager/style_manager.dart';


void callMySnackBar({required context, required String text})
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: StyleManager.snackBarError,),
      duration:const Duration(seconds: 2) ,
    ),

  );
}