import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:quickly_app/core/core_widgets/default_button.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/forgot_password/presentation/views/change_forgotten_pass_view.dart';
import 'package:quickly_app/features/forgot_password/presentation/views/widgets/pinput.dart';

import '../../../../../core/core_widgets/default_loading.dart';
import '../../../../../core/core_widgets/help_ask_row.dart';
import '../../../../../core/core_widgets/my_snack_bar.dart';
import '../../../../../core/resources_manager/delay_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';
import '../../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../../cubit/verify_code_cubit/verify_code_states.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({Key? key}) : super(key: key);

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  int counter = 15;
  void startDecrement() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        counter--;
        if (counter > 0) {
          startDecrement();
        }
      });
    });
  }
  @override
  void initState() {
    super.initState();
    startDecrement();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const SizedBox(height: 65, child: HelpAskRow()),
        const SizedBox(height: 73),
        const Text(
          'تأكيد الرمز',
          style: StyleManager.sendCode,
        ),
        const SizedBox(
          height: 82,
        ),
        const OnlyBottomCursor(),
        const SizedBox(
          height: 27.3,
        ),
        InkWell(
          onTap: counter==0? ()
          {
            Navigator.pop(context);
            Get.previousRoute;
          }: null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.iconRedo,
                  height: 11.02,
                  width: 11.02,
                  color: counter ==0 ?
                  ColorsManager.primaryColor:
                  ColorsManager.secondary,
                ),
                const SizedBox(
                  width: 4.2,
                ),
                Text(
                  'اعاده ارسال الرمز مره اخري',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: counter ==0 ?
                    ColorsManager.primaryColor:
                    ColorsManager.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text('$counter', style: StyleManager.timeToResend),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 37,
        ),
        BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
            builder: (context, state)
            {
              if (state is VerifyCodeLoadingState)
              {
                return const DefaultLoading();
              }
              else {
                return DefaultButton(
                    text: 'تأكيد',
                    style: StyleManager.confirmButton,
                    background: VerifyCodeCubit
                        .get(context)
                        .color,
                    onPressed: VerifyCodeCubit
                        .get(context)
                        .complete ?
                        () async {
                      await VerifyCodeCubit.get(context).verifyCode();
                    } : null
                );
              }
              },
            listener: (context, state)
            {
              if (state is VerifyCodeSuccessState)
              {
                Get.to(() => const ChangeForgottenPassView(),
                    transition: DelayManager.transitionRegister,
                    duration: DelayManager.durationTransitionRegister);
              }
              if (state is VerifyCodeErrorState )
              {
                callMySnackBar(context: context, text: state.error);
              }

            })
      ],
    );
  }
}

