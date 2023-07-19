import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/help_ask_row.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/resources_manager/style_manager.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/send_code_cubit/send_code_cubit.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/send_code_cubit/send_code_states.dart';
import 'package:quickly_app/features/forgot_password/presentation/views/verify_code_view.dart';

import '../../../../../core/core_widgets/default_button.dart';
import '../../../../../core/core_widgets/default_form_field.dart';
import '../../../../../core/core_widgets/default_loading.dart';
import '../../../../../core/core_widgets/my_snack_bar.dart';
import '../../../../../core/resources_manager/assets_manager.dart';
import '../../../../../core/resources_manager/delay_manager.dart';

class SendCodeViewBody extends StatelessWidget {
  SendCodeViewBody({Key? key}) : super(key: key);

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendCodeCubit, SendCodeStates>(
      builder: (context, state)
      {
        return Form(
          key: SendCodeCubit.get(context).formKey,
          child: Column(
            children: [
              const SizedBox(height: 15,),
              const SizedBox(height: 65, child: HelpAskRow()),
              const SizedBox( height: 73 ),
              const Text(
                'إرسال كود',
                style: StyleManager.sendCode,
              ),
              const SizedBox(
                height: 70,
              ),
              DefaultFormField(
                hint: "رقم الموبيل",
                controller: phoneController,
                icon: SvgPicture.asset(AssetsManager.iconPhone,
                  height: 16.16,
                  width: 16.16,
                ),
                textInputType : TextInputType.phone,
                suffixIcon: const Text(
                  '20+',
                  style: StyleManager.countryCodeFormField,),
                validator: (value)
                {
                  if (value!.isEmpty ||  SendCodeCubit.get(context).hasError) {
                    return SendCodeCubit.get(context).validateMessage;
                  }
                  return null;
                },
                onChange: (value)
                {
                  SendCodeCubit.get(context).changeColor(value);
                },
              ),
              const SizedBox(height: 41,),

              state is SendCodeLoadingState?
              const DefaultLoading()
              :
              DefaultButton(
                  text: "إرسال",
                  style: StyleManager.sendCodeButton,
                  background: SendCodeCubit.get(context).color,
                  onPressed: SendCodeCubit.get (context).color ==ColorsManager.secondary?
                      null :
                      () {
                    SendCodeCubit.get(context).onPressed(phoneNumber: phoneController.text);
                  }
              )
            ],
          ),
        );
      },
      listener: (context, state)
      {

        if (state is SendCodeSuccessState ){

            Get.to (
                  ()=> const VerifyCodeView(),
              transition: DelayManager.transitionRegister,
              duration: DelayManager.durationTransitionRegister
          );
        }
        if (state is SendCodeErrorState)
        {
          callMySnackBar(context: context, text: state.error);
        }

      },
    );
  }
}
