import 'package:flutter/material.dart';
import 'package:quickly_app/features/secretary/presentation/views/widgets/secretary_list_item_builder.dart';

class SecretariesListView extends StatelessWidget {
  const SecretariesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17.0),
            topLeft: Radius.circular(17.0),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index)=> const SecretaryListItemBuilder(),
        itemCount: 3,
      ),
    );
  }
}
