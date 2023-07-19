import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import '../local_database/cache_data.dart';
import '../local_database/cache_helper_keys.dart';
class DefaultRating extends StatelessWidget {
  const DefaultRating({Key? key, required this.rate, this.readOnly = true,
  this.emptyColor = ColorsManager.packageRowLight,
    this.fullColor = ColorsManager.primaryColor}) : super(key: key);
  final double rate;
  final bool readOnly;
  final Color emptyColor;
  final Color fullColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: CacheData.lang == CacheHelperKeys.keyAR ? TextDirection.ltr : TextDirection.rtl,
      child: RatingBar(
        itemPadding: EdgeInsets.zero,
          ignoreGestures: readOnly,
          tapOnlyMode: readOnly,
          direction: Axis.horizontal,
          allowHalfRating: true,
          glowColor: Colors.white,
          updateOnDrag: !readOnly,
          initialRating: rate,
          itemSize: readOnly ? 18:30,
          itemCount:5,
          ratingWidget: RatingWidget(
              full:  Icon(Icons.star_rate_rounded,
                  color: fullColor),
              half:  Icon(
                Icons.star_rate_rounded,
                color: emptyColor,
              ),
              empty:  Icon(
                Icons.star_rate_rounded,
                color: emptyColor,
              )),
          onRatingUpdate: (value)
          {
          }),
    );
  }
}
