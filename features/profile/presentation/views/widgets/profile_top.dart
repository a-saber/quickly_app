import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_rating.dart';
import 'package:quickly_app/core/core_widgets/my_snack_bar.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';


class ProfileTop extends StatefulWidget {
  const ProfileTop({Key? key}) : super(key: key);

  @override
  State<ProfileTop> createState() => _ProfileTopState();
}
bool isComments = false;

class _ProfileTopState extends State<ProfileTop> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children:
        [
          const SizedBox(height: 25,),
          Row(
            children:
            [
              Expanded(
                  child: InkWell(
                    onTap: ()
                    {
                      isComments = false;
                      setState(() {});
                    },
                    child: Center(
                      child: Text(
                          TranslationKeyManager.personalData.tr,
                        style: isComments ?StyleManager.personalData.copyWith(color: Colors.white) :StyleManager.personalData,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ),

              InkWell(
                onTap: (){},
                child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) =>
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration :BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                  boxShadow:
                                  [
                                    const BoxShadow(
                                        color: Colors.transparent,
                                        offset: Offset(0, 1)
                                    ),
                                    BoxShadow(
                                      color:  !isComments ?
                                      ColorsManager.primaryColor :
                                      Colors.transparent,
                                      offset: const Offset(1, 0),
                                      spreadRadius: 0.5,

                                    ),
                                    BoxShadow(
                                        color: !isComments ?
                                        Colors.transparent :
                                        ColorsManager.primaryColor ,
                                        spreadRadius: 0.5,
                                        offset: const Offset(-1, 0)
                                    ),
                                    const BoxShadow(
                                        color: Colors.transparent,
                                        offset: Offset(0, 0)
                                    ),
                                  ],
                                image: DecorationImage(image: imageProvider)
                              ),
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage: imageProvider,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: SvgPicture.asset(AssetsManager.camIcon),
                            )
                          ],
                        ),
                    placeholder: (context, error) =>
                    const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                    ),
                    fit: BoxFit.fill,
                    imageUrl: 'https://cloudfront.slrlounge.com/wp-content/uploads/2014/01/black-clothing-background-2.jpg',
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.image_outlined))
                ),
              ),

              Expanded(
                  child: InkWell(
                    onTap: ()
                    {
                      isComments = true;
                      setState(() {});
                    },
                    child: Center(
                      child: Text(
                        TranslationKeyManager.comments.tr,
                        style: isComments ? StyleManager.personalData :StyleManager.personalData.copyWith(color: Colors.white),
                      ),
                    ),
                  )
              ),

            ],
          ),
          const SizedBox(height: 17,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5.5,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.greenLight,
                    radius: 5,
                  ),
                ),
                const SizedBox(width: 5,),
                Text('محمد مصطفي', style: StyleManager.profileName,),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: ()
                  {
                    callMySnackBar(context: context, text: TranslationKeyManager.contactCustomersService.tr);
                  },
                    child: SvgPicture.asset(AssetsManager.editIcon, width: 19)
                ),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultRating(rate: 4, ),
              const SizedBox(width: 6,),
              Text('4+', style: StyleManager.rateNumber.copyWith(color: Colors.white),)
            ],
          ),
          const SizedBox(height: 15,)

        ],
      ),
    );
  }
}


/*
CircleAvatar(
                            radius: 45,
                            backgroundColor: ColorsManager.primaryColor,
                            child: Padding(
                              padding:  EdgeInsetsDirectional.only(
                                  end: isComments ? 1.5 : 0,
                                  start: !isComments ? 1.5 : 0,
                              ),
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage: imageProvider,
                              ),
                            ),
                          ),
 */