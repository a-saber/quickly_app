import 'package:flutter/material.dart';

import 'order_item_builder.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({Key? key,
    required this.isCurrent
  }) : super(key: key);

  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder:
        (context, index)=> Column(
          children: [
            OrderItemBuilder(isCurrent: isCurrent),
            SizedBox(height: 14,),
          ],
        ),
      itemCount: 3,
    );
  }
}
