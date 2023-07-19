
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/default_network_image.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/profile/presentation/views/widgets/profile_bottom_comments.dart';

import 'package:quickly_app/features/profile/presentation/views/widgets/profile_top.dart';

import 'profile_bottom_data.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:
      [
        CachedNetworkImage(
            imageBuilder: (context, imageProvider) =>
        Transform.scale(
            scale: 1.5,
            child: Image(image: imageProvider)
        ),
            placeholder: (context, error) =>
            const Icon(
              Icons.image_outlined,
              color: Colors.grey,
            ),
            fit: BoxFit.fill,
            imageUrl:  'https://cloudfront.slrlounge.com/wp-content/uploads/2014/01/black-clothing-background-2.jpg',
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.image_outlined))
        ),


        Transform.scale(
          scale: 1.5,
          child: Container(
            // height: MediaQuery.of(context).size.height/2,
            color: ColorsManager.black.withOpacity(0.5),
          ),
        ),
        Column(
          children:
          [
            DefaultBar(title: TranslationKeyManager.profile, hasPop: false,),
            ProfileTop(),
            isComments ?
                ProfileBottomComments():
            ProfileBottomData()
          ],
        ),
      ],
    );
  }
}


/*
ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              decoration: BoxDecoration(
              color:  ColorsManager.black.withOpacity(0.1),
              ),
            ),
          ),
        ),
 */