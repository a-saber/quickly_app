import 'package:flutter/material.dart';

import 'guarantee_item_builder.dart';

class GuaranteeListView extends StatelessWidget {
  const GuaranteeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemBuilder:
        (context, index)=>  Column(
          children: const
          [
            GuaranteeItemBuilder(),
            SizedBox(height: 14,),
          ],
        ),
      itemCount: 3,
    );
  }
}
