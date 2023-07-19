import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';
import 'package:quickly_app/features/register/data/parts/parts.dart';
import 'package:quickly_app/features/register/presentation/views/widgets/parts/part_item_builder.dart';


class PartsView extends StatelessWidget {
  const PartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 35.0,right: 17,left: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          const Padding(
            padding:  EdgeInsets.only(right: 5.0),
            child: Text(
              'اختر  تخصص  شركتك',
              style: StyleManager.choosePackage,
              softWrap: false,
              textAlign: TextAlign.start,

            ),
          ),
          const SizedBox(height: 6,),
          ListView.separated(
            itemBuilder: (context, index)=>
                PartItemBuilder(part: parts[index]),
            separatorBuilder: (context, index)=>
            const SizedBox(height: 15,),
            itemCount: parts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const SizedBox(height: 30,),

        ],
      ),
    );
  }
}
