import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';

import '../../../../../../core/resources_manager/assets_manager.dart';
import '../../../../../../core/resources_manager/delay_manager.dart';
import '../register_view_body.dart';

class PackageItemBuilder extends StatefulWidget {
  const PackageItemBuilder({Key? key, required this.package}) : super(key: key);

  final Package package;

  @override
  State<PackageItemBuilder> createState() => _PackageItemBuilderState();
}

class _PackageItemBuilderState extends State<PackageItemBuilder> {
  bool colorChange= false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        setState(() {
          colorChange = true;
        });
        Future.delayed( const Duration(milliseconds: 1800) , ()
        {
          animationController.forward();
          slidingAnimation.addListener(()
          {
            setState(() {});
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 115,
        decoration: BoxDecoration(
          color: colorChange ? ColorsManager.black : Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 0 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            colorChange ? AssetsManager.registerFullCircle: AssetsManager.registerEmptyCircle,
                            height: 11),
                        const SizedBox(width: 8,),
                        Text(
                          widget.package.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StyleManager.packageLabel,
                        ),
                        Text(
                          widget.package.hint,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StyleManager.packageHint,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                          left: 20,
                          ),
                      child: Text(
                        widget.package.desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: StyleManager.packageDesc,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorsManager.black,
                  borderRadius: BorderRadius.circular(2.0)
              ),
              padding: const EdgeInsets.only(
                  right: 22,
                  left: 12,
                  top: 6.5,
                  bottom: 6.5,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: SvgPicture.asset(AssetsManager.registerPackageIcon,height: 13,),
                  ),
                  const Text(
                    'رسوم إنتقال وفحص',
                    style: StyleManager.packageRow
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 20,
                    child: Text(
                          'L.E',
                          style: StyleManager.packageCurrency,
                        ),
                  ),
                      const SizedBox(width: 2,),
                  SizedBox(
                    height: 17,
                    child: Text(
                      '${widget.package.price}',
                      style: StyleManager.packagePrice ,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
