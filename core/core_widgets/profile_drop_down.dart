import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import '../resources_manager/style_manager.dart';

class ProfileDropDown extends StatelessWidget {
  ProfileDropDown({Key? key,
    // required this.hint,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.hint,
  }) : super(key: key);
  //final String hint;
  String? value;
  String hint;
  final void Function(String?)? onChanged;
  final List<String> items;

  String? printer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: ColorsManager.formFieldFill,
          border: Border.all(color: ColorsManager.packageRowLight)
      ),
      //height: 30,
      //padding: const EdgeInsetsDirectional.only(start: 10),
      child: DropdownButton(
        padding: EdgeInsetsDirectional.only(start:10 ),
          hint: Text(hint, style: StyleManager.dropDown,),
          isExpanded: true,
          style: StyleManager.dropDown.copyWith(color: ColorsManager.black, fontSize: 13),
          underline: const SizedBox(),
          icon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: SvgPicture.asset(
            AssetsManager.profileDown),
          ),
          //dropdownColor: ColorsManager.primaryColor,
          value: value,
          items:
          items.map(buildMenuItem).toList(),
          onChanged: onChanged
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
          onTap: () {},
          value: item,
          child: Text(
            item,
            style:
            StyleManager.dropDown.copyWith(color: ColorsManager.black, fontSize: 13),
          )
      );
}