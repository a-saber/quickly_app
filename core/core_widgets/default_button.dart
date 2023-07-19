import 'package:flutter/material.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.style,
    required this.background,
    required this.onPressed,
    this.height = 48,

  }) : super(key: key);
  final TextStyle style;
  final String text;
  final void Function()? onPressed;
  final Color background;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: background,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 45),
      padding: const EdgeInsets.symmetric(vertical: 0),
      width: double.infinity,
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
              text,
              style: style
          )),
    );
  }
}
