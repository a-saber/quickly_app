
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class StepItemBuilder extends StatelessWidget {
  const StepItemBuilder({
    Key? key,
    required this.order,
    this.isChosen = false,
    required this.image,
    required this.label,
    required this.alignment,

  }) : super(key: key);

  final int order;
  final bool isChosen;
  final String image;
  final String label;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: order==3? const EdgeInsets.only(left: 2.0): const EdgeInsets.all(0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
                angle: pi,
                child: SizedBox(
                    width: 140,
                    height: 47,
                    child: SvgPicture.asset(image,))),
            Padding(
              padding:
              order == 1 ?
              const EdgeInsets.only(left: 15):
              order == 2?
              const EdgeInsets.only(right: 0):
              const EdgeInsets.only(right: 15)
              ,
              child: Column(
                children: [
                  Text(
                    '$order',
                    style: isChosen ?StyleManager.stepNumberChosen : StyleManager.stepNumberUnChosen,
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    label,
                    style:  isChosen ? StyleManager.stepLabelChosen : StyleManager.stepLabelUnChosen,
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
