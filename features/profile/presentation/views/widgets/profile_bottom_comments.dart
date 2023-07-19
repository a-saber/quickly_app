import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_check_box.dart';
import 'package:quickly_app/core/core_widgets/profile_drop_down.dart';
import 'package:quickly_app/core/core_widgets/profile_form_field.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/profile/presentation/views/widgets/comment_item_builder.dart';

class ProfileBottomComments extends StatelessWidget {
  const ProfileBottomComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(17.0),
              topLeft: Radius.circular(17.0),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 34),
        child: ListView.builder(
            itemBuilder: (context, index)=>CommentItemBuilder(),
        itemCount: 3,),
      ),
    );
  }
}

