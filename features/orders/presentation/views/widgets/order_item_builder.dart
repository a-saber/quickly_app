import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class OrderItemBuilder extends StatelessWidget {
  const OrderItemBuilder({Key? key,required this.isCurrent }) : super(key: key);

  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: ColorsManager.formFieldFill,
        border: Border.all(
          width: 1,
          color: ColorsManager.packageRowLight
        )
      ),
      padding: const EdgeInsetsDirectional.only(
          top: 15,
          bottom: 15,
          start: 15,
          end: 13,
      ),
      child: Row(
        children:
        [
          Column(
            children: [
              Text('5',style: StyleManager.timeNumber,),
              Text('ساعات',style: StyleManager.timeUnit,),
            ],
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text("${TranslationKeyManager.orderNumber.tr} 123456 #",
                  style: StyleManager.orderNumber,
                ),
                Text('عطل في الديب فريزر . بيكون تلج كتير ومش بيتلج أي اكل فيه عطل في الديب فريزر . بيكون تلج كتير ومش بيتلج أي اكل فيه',
                style: StyleManager.orderDesc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 20,),
          isCurrent ?
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                    imageBuilder: (context, imageProvider) =>
                        CircleAvatar(
                          radius: 17.5,
                          backgroundImage: imageProvider,
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
                CircleAvatar(
                  radius: 4.3,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 3.8,
                    backgroundColor: ColorsManager.greenLight,
                  ),
                )
              ],
            ),
          )
          :
          Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: SvgPicture.asset(AssetsManager.seen),
          ),

        ],
      ),
    );
  }
}
