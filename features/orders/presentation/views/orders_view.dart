import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/default_drop_down.dart';
import 'package:quickly_app/core/core_widgets/my_tab_bar_view.dart';
import 'package:quickly_app/core/core_widgets/profile_form_field.dart';
import 'package:quickly_app/core/core_widgets/tab_bar_item.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';

import 'widgets/guarantee_list_view.dart';
import 'widgets/orders_list_view.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  bool current = true;
  bool previous = false;
  bool guarantee = false;
  String? region;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: Column(
          children:
          [
            const DefaultBar(title: TranslationKeyManager.orders),
            const SizedBox(height: 30,),
            Expanded(
              child: Stack(
                children:
                [
                  Column(
                    children: [
                      const SizedBox(height: 33,),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(17.0),
                                topLeft: Radius.circular(17.0),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 38),
                          child: Column(
                            children:
                            [
                              Row(
                                children:
                                [
                                  Expanded(
                                    child: SizedBox(
                                      height: 27,
                                      child: ProfileFormField(
                                        enabled: false,
                                        hint: TranslationKeyManager.engineerName.tr,
                                        controller: TextEditingController(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  SizedBox(
                                    width: 174,
                                    height: 27,
                                    child: DefaultDropDown(
                                        value: region,
                                        onChanged: (value)
                                        {
                                          setState(() {
                                            region = value;
                                          });
                                        },
                                        items: List<String>.generate(
                                            4, (index) => '${TranslationKeyManager.determineArea.tr} ${index+1}'),
                                        hint: TranslationKeyManager.determineArea.tr
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height:20 ,),
                              guarantee ?
                              const Expanded(child: GuaranteeListView())
                              :
                              Expanded(child: OrdersListView(isCurrent: current,))
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: MyTabBarView(
                      length: 3,
                      onTab: (index)
                      {
                        current = false;
                        previous = false;
                        guarantee = false;
                        if(index ==0)
                        {
                          current = true;
                        }
                        else if(index ==1)
                        {
                          previous = true;
                        }
                        else
                        {
                          guarantee = true;
                        }
                        setState(() {});
                      },
                      tabs:
                      [
                        TabBarItem(label: TranslationKeyManager.current, selected: current),
                        TabBarItem(label: TranslationKeyManager.previous, selected: previous),
                        TabBarItem(label: TranslationKeyManager.guarantee, selected: guarantee),
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}
