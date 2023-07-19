import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickly_app/core/core_widgets/default_rating.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class CommentItemBuilder extends StatelessWidget {
  const CommentItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            CachedNetworkImage(
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(
                      radius: 17.5,
                      backgroundColor: ColorsManager.primaryColor,
                      child: CircleAvatar(
                        radius: 16.0,
                        backgroundImage: imageProvider,
                      ),
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
            const SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 2.0),
                  child: Text('محسن محمد احمد', style: StyleManager.commentOwnerName,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DefaultRating(rate: 2, emptyColor: ColorsManager.secondary, ),
                    const SizedBox(width: 3,),
                    Text('2+', style: StyleManager.rateNumber.copyWith(
                        color: ColorsManager.primaryColor,
                    height: 1),)
                  ],
                ),
              ],
            )

          ],
        ),
        const SizedBox(height: 5,),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.formFieldFill,
            border: Border.all(color: ColorsManager.packageRowLight)
          ),
          padding: const EdgeInsetsDirectional.only(
            start: 7,
            end: 4,
            top: 7,
            bottom: 7
          ),
          child: Row(
            children:
            [
              Expanded(child: Text('مهندس محترم في شغله واتمه على اكمل وجه'
              ,style: StyleManager.commentOwnerName.copyWith(color: ColorsManager.black),
              )),
              const Text('منذ 2 يوم', style: StyleManager.sinceTime,)
            ],
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
