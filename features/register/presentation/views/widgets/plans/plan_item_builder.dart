import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';
import 'package:quickly_app/features/register/data/plans/plans.dart';

import '../../../../../../core/resources_manager/assets_manager.dart';
import '../../../../../../core/resources_manager/delay_manager.dart';
import '../register_view_body.dart';

class PlanItemBuilder extends StatefulWidget {
  const PlanItemBuilder({Key? key, required this.plan}) : super(key: key);

  final Plan plan;

  @override
  State<PlanItemBuilder> createState() => _PlanItemBuilderState();
}

class _PlanItemBuilderState extends State<PlanItemBuilder> {
  bool colorChange= false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
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
          height: 229,
          decoration: BoxDecoration(
            color: colorChange ? ColorsManager.black : Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4.0),
                topLeft: Radius.circular(4.0),
            ),
          ),
          child: Column(

            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          colorChange ? AssetsManager.registerFullCircle: AssetsManager.registerEmptyCircle,
                          height: 13
                      ),
                       const SizedBox(height: 3,),
                       Align(
                        alignment: Alignment.center,
                        child: Text(
                          "خطة اشتراك ${widget.plan.number}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StyleManager.planTitle,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      ListView.separated(
                          itemBuilder: (context, index)=>
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    planOptions[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: widget.plan.options.contains(index+1)?
                                    StyleManager.planActiveOption:
                                    StyleManager.planInActiveOption,
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: SvgPicture.asset(
                                      widget.plan.options.contains(index+1)?
                                        AssetsManager.registerPlansChecked:
                                        AssetsManager.registerPlansUnChecked,
                                      height: 11,
                                    ),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index)=>
                          const SizedBox(),
                          itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                    color: widget.plan.price ==0 ?
                        Colors.transparent:
                    ColorsManager.black,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(2.0),
                      topLeft: Radius.circular(2.0),
                    ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                ),
                child: widget.plan.price ==0 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsManager.yellow.withOpacity(0.4)
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical:0
                          ),
                          child: const Text(
                            'مجانية',
                            style: StyleManager.planFree,),
                        )
                      ],
                    ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: SvgPicture.asset(AssetsManager.registerPackageIcon,height: 13,),
                    ),
                    
                    const Text(
                        'رسوم اشتراك',
                        style: StyleManager.planRow
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
                      height: 16,
                      child: Text(
                        '${widget.plan.price}',
                        style: StyleManager.packagePrice ,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
