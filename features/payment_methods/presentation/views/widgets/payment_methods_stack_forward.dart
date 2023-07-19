import 'package:flutter/material.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

import 'payment_methods_list_item_builder.dart';

class PaymentMethodsStackForward extends StatefulWidget {
  const PaymentMethodsStackForward({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsStackForward> createState() => _PaymentMethodsStackForwardState();
}

class _PaymentMethodsStackForwardState extends State<PaymentMethodsStackForward> {
  bool cashSelected= false;
  bool visaSelected= false;
  bool vodafoneSelected= false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        padding: const EdgeInsetsDirectional.only(
            start: 7,
            end: 14,
            bottom: 10),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children:
        [
          SizedBox(
            child: PaymentMethodsListItemBuilder(
              text: TranslationKeyManager.cashPayment,
              selected: cashSelected,
              onTap: ()
              {
                setState(()
                {
                  cashSelected =true;
                  visaSelected = false;
                  vodafoneSelected = false;
                });
              },
              style: StyleManager.paymentMethods.copyWith(fontSize: 13),
            ),
          ),
          const SizedBox(width: 10,),
          PaymentMethodsListItemBuilder(
            text: TranslationKeyManager.visaPayment,
            selected: visaSelected,
            onTap: ()
            {
              setState(()
              {
                cashSelected =false;
                visaSelected = true;
                vodafoneSelected = false;
              });
            },
            image: AssetsManager.visaIMG,
          ),
          const SizedBox(width: 10,),
          PaymentMethodsListItemBuilder(
            text: TranslationKeyManager.fawryVodafon,
            selected: vodafoneSelected,
            onTap: ()
            {
              setState(()
              {
                cashSelected =false;
                visaSelected = false;
                vodafoneSelected = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
