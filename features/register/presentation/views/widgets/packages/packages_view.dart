import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/register/data/packages/packages.dart';

import 'package_item_builder.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({Key? key}) : super(key: key);

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
              'اختر  نشاط  شركتك',
              style: StyleManager.choosePackage,
              softWrap: false,
              textAlign: TextAlign.start,

            ),
          ),
          const SizedBox(height: 8,),
          ListView.separated(
              itemBuilder: (context, index)=>
              PackageItemBuilder(package: packages[index]),
              separatorBuilder: (context, index)=>
              const SizedBox(height: 14,),
              itemCount: packages.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}
