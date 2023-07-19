import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/resources_manager/colors_manager.dart';
import '../../../../../core/resources_manager/delay_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';
import '../../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../../cubit/verify_code_cubit/verify_code_states.dart';
import '../change_forgotten_pass_view.dart';

class OnlyBottomCursor extends StatefulWidget {
  const OnlyBottomCursor({Key? key}) : super(key: key);

  @override
  _OnlyBottomCursorState createState() => _OnlyBottomCursorState();

  @override
  String toStringShort() => 'With Bottom Cursor';
}

class _OnlyBottomCursorState extends State<OnlyBottomCursor> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      textStyle: StyleManager.codeNumber,
      //width: 90,
     // height: 56,
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: ColorsManager.secondary,
          ),
        ),
        const SizedBox(
          height: 10.7,
        ),
        Container(
          width:45,
          height: 1.5,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
            color: ColorsManager.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    final preFilledWidget = Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.secondary,
              ),
            ),
            const SizedBox(
              height: 10.7,
            ),
            Container(
              width: 45,
              height: 1.5,
              decoration: BoxDecoration(
                color: ColorsManager.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );

    return BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Pinput(
              length: 6,
              pinAnimationType: PinAnimationType.slide,
              controller: controller,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              cursor: cursor,
              preFilledWidget: preFilledWidget,
              onCompleted: (code) async
              {
                await VerifyCodeCubit.get(context).verifyCode();
              },
              onChanged: (value)
              {
                VerifyCodeCubit.get(context).onChangePinPut(value);
              },
            ),
          );
        },
        listener: (context, state)
        {
          if (state is VerifyCodeSuccessState) {
            Get.to (
                    ()=> const ChangeForgottenPassView(),
                transition: DelayManager.transitionRegister,
                duration: DelayManager.durationTransitionRegister
            );
          }
        });
  }
}
