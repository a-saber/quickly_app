import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources_manager/assets_manager.dart';
import '../resources_manager/style_manager.dart';

class DefaultBar extends StatelessWidget {
  const DefaultBar({
    Key? key,
    required this.title,
    this.icon,
    this.onPressed,
    this.hasPop = true,
  }) : super(key: key);

  final bool hasPop;
  final String title;
  final Widget? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child:  Row(
        children:
        [

          IconButton(
              onPressed: hasPop ?
                  ()
              {
                Navigator.pop(context);
              }:
              icon==null?
              null :
              onPressed,
              icon: hasPop ?
              SvgPicture.asset(AssetsManager.iconArrowBack,)
                  :
              icon==null?
              SizedBox():
                  icon!
          ),

          Expanded(child: Center(child: Text(title.tr, style: StyleManager.homeAppBarTitle,)),),

          Padding(
            padding: const EdgeInsetsDirectional.only(end: 21.0),
            child: SvgPicture.asset(AssetsManager.iconDrawer, width: 31, height: 12,),
          ),
        ]
      ),
    );
  }
}
