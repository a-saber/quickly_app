import 'package:flutter/material.dart';
import 'package:quickly_app/core/core_widgets/default_drop_down.dart';
import 'package:quickly_app/features/engineer/presentation/views/widgets/engineer_list_item_builder.dart';

class EngineersListView extends StatefulWidget {
  const EngineersListView({Key? key}) : super(key: key);

  @override
  State<EngineersListView> createState() => _EngineersListViewState();
}

class _EngineersListViewState extends State<EngineersListView> {
  String? rateValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17.0),
            topLeft: Radius.circular(17.0),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 26),
      child: Column(
        children: 
        [
          SizedBox(
            width: 174,
            height: 27,
            child: DefaultDropDown(
                value: rateValue,
                onChanged: (value)
                {
                  setState(() {
                    rateValue = value;
                  });
                },
                items: List<String>.generate(4, (index) => 'أقل من ${index+1}'),
                hint: 'التقييم'),
          ),
          const SizedBox(height: 36,),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index)=> const EngineerListItemBuilder(),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
