import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';

class PaymentMethodsListItemBuilder extends StatelessWidget {
  const PaymentMethodsListItemBuilder({Key? key,
  required this.text,
  required this.onTap,
  this.image,
  required this.selected ,
  this.style = StyleManager.paymentMethods,
  }) : super(key: key);

  final String text;
  final String? image;
  final void Function()? onTap;
  final TextStyle style;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 125,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Material(
          elevation: 5,
            color: ColorsManager.formFieldFill,
          borderRadius: BorderRadius.circular(2),
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: selected ? ColorsManager.primaryColor :ColorsManager.formFieldFill
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Text(text.tr, style: selected ? style.copyWith(color: ColorsManager.formFieldFill) :style, textAlign: TextAlign.center,),
                if(image != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.8),
                    child: Image(image: AssetImage(image!)),
                  )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
