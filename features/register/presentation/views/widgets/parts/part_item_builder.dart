import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';
import 'package:quickly_app/features/register/data/parts/parts.dart';
import '../../../../../../core/resources_manager/assets_manager.dart';
import '../../../../../../core/resources_manager/delay_manager.dart';
import '../register_view_body.dart';

class PartItemBuilder extends StatefulWidget {
  const PartItemBuilder({Key? key, required this.part}) : super(key: key);

  final Part part;

  @override
  State<PartItemBuilder> createState() => _PartItemBuilderState();
}

class _PartItemBuilderState extends State<PartItemBuilder> {
  bool colorChange= false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        setState(() {
          colorChange = true;
        });
        // Future.delayed( const Duration(milliseconds: 1800) , ()
        // {
        //   animationController.forward();
        //   slidingAnimation.addListener(()
        //   {
        //     setState(() {});
        //   });
        // });
      },
      child: Container(
        height: 91.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children:
          [
            Container(
              width: 6,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: ColorsManager.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                    )
              ),
            ),
            const SizedBox(width: 6,),

            SvgPicture.asset(
                colorChange ? AssetsManager.registerFullCircle: AssetsManager.registerEmptyCircle,
                height: 11),
            const SizedBox(width: 8,),
            SizedBox(
              width: 280,
              child: Text(
                widget.part.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StyleManager.partTitle,
              ),
            ),
            Expanded(
                child: SvgPicture.asset(widget.part.image,height: 42,)),

          ],
        ),
      ),
    );
  }
}
