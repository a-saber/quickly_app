import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_button.dart';
import 'package:quickly_app/core/core_widgets/default_form_field.dart';
import 'package:quickly_app/core/core_widgets/default_loading.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/change_forgotten_pass_cubit/change_forgotten_pass_cubit.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/change_forgotten_pass_cubit/change_forgotten_pass_states.dart';

import '../../../../../core/core_widgets/help_ask_row.dart';
import '../../../../../core/core_widgets/my_snack_bar.dart';
import '../../../../../core/resources_manager/delay_manager.dart';
import '../../../../../core/resources_manager/style_manager.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../data/repos/forget_password_repo_implementation.dart';


class ChangeForgottenPassViewBody extends StatelessWidget {
  const ChangeForgottenPassViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var passwordConfirm = TextEditingController();
    return BlocConsumer<ChangeForgottenPassCubit, ChangeForgottenPassStates>(
    builder: (context, state)
    {

      return Form(
        key: ChangeForgottenPassCubit.get(context).formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: 65, child: HelpAskRow()),
            const SizedBox(height: 73),
            const Text(
              'تعيين الرقم السري',
              style: StyleManager.sendCode,
            ),
            const SizedBox(height: 68),
            DefaultFormField(
              isPassword: ChangeForgottenPassCubit.get(context).passHide,
              icon: SvgPicture.asset(AssetsManager.iconLock,
                height: 15.79,
                width: 13.82,
              ),
              hint: 'الرقم السري الجديد',
              controller: password,
              suffixIcon: InkWell(
                onTap: ()
                {
                  ChangeForgottenPassCubit.get(context).showPass(isPass: true);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: SvgPicture.asset(AssetsManager.iconEye,
                    height: 10.4,
                    width: 14.3,
                  ),
                ),
              ),
              validator: (value)
              {
                if (value!.isEmpty || ChangeForgottenPassCubit.get(context).hasError) {
                  return ChangeForgottenPassCubit.get(context).validateMessage;
                }
                return null;
              },
              onChange: (value)
              {
                ChangeForgottenPassCubit.get(context).changeColor(
                  pass: value,
                  confirm: passwordConfirm.text
                    );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultFormField(
              isPassword: ChangeForgottenPassCubit.get(context).confirmHide,
              icon: SvgPicture.asset(AssetsManager.iconLock,
                  height: 15.79,
                  width: 13.82
              ),
              hint: 'تأكيد الرقم السري',
              controller: passwordConfirm,
              suffixIcon: InkWell(
                onTap: ()
                {
                  ChangeForgottenPassCubit.get(context).showPass(isPass: false);

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: SvgPicture.asset(AssetsManager.iconEye,
                    height: 10.4,
                    width: 14.3,
                  ),
                ),
              ),
              validator: (value)
              {
                if (value!.isEmpty || ChangeForgottenPassCubit.get(context).hasError) {
                  return ChangeForgottenPassCubit.get(context).validateMessage;
                }
                return null;
              },
              onChange: (value)
              {
                ChangeForgottenPassCubit.get(context).changeColor(
                    pass: password.text,
                    confirm:value
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            state is ChangeForgottenPassLoadingState?
            const DefaultLoading():
            DefaultButton(
                text: 'تحديث',
                style: StyleManager.confirmButton,
                background: ChangeForgottenPassCubit.get(context).color,
                onPressed: ChangeForgottenPassCubit.get(context).color == ColorsManager.primaryColor ?
                  ()
                {
                  ChangeForgottenPassCubit.get(context).onPressed(
                      pass: password.text,
                      confirm: password.text,
                  );
                }: null
            )
          ],
        ),
      );
    },
    listener:(context, state)
    {
      if (state is ChangeForgottenPassSuccessState){
        Get.to (
                ()=> Scaffold(appBar: AppBar(title: const Text('Home'),)),
            transition: DelayManager.transitionRegister,
            duration: DelayManager.durationTransitionRegister
        );
      }
      if (state is ChangeForgottenPassDataErrorState){
        print("99999999999999");
        callMySnackBar(context: context, text: state.error);
      }
      if (state is ChangeForgottenPassErrorState){
        print("..............");
        callMySnackBar(context: context, text: state.error);
      }
    }
    );
  }
}
