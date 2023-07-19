import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/core_widgets/default_bar.dart';
import 'package:quickly_app/core/core_widgets/default_button.dart';
import 'package:quickly_app/core/core_widgets/default_form_field.dart';
import 'package:quickly_app/core/core_widgets/default_loading.dart';
import 'package:quickly_app/core/localization/translation_key_manager.dart';
import 'package:quickly_app/core/resources_manager/assets_manager.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/change_password/presentation/cubit/change_pass_cubit/change_pass_cubit.dart';
import 'package:quickly_app/features/change_password/presentation/cubit/change_pass_cubit/change_pass_states.dart';


import '../../../../../core/resources_manager/style_manager.dart';


class ChangePassViewBody extends StatelessWidget {
  const ChangePassViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oldPass = TextEditingController();
    var newPass = TextEditingController();
    var newPassConfirm = TextEditingController();

    return Column(
      children:
      [
        const DefaultBar(title: TranslationKeyManager.changePassword),
        const SizedBox(height: 23,),
         Expanded(
             child: Container(
               decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(17.0),
                     topLeft: Radius.circular(17.0),
                   )),
               padding: const EdgeInsets.only(top: 70,bottom: 20, right: 25,left: 25),
               child: BlocConsumer<ChangePassCubit, ChangePassStates>(
                   builder: (context, state)
                   {
                     return Form(
                       key: ChangePassCubit.get(context).formKey,
                       child: Column(
                         children: [
                           DefaultFormField(
                             isPassword: ChangePassCubit.get(context).oldPassHide,
                             icon: SvgPicture.asset(AssetsManager.iconLock,
                               height: 15.79,
                               width: 13.82,
                             ),
                             hint: TranslationKeyManager.currentPass.tr,
                             controller: oldPass,
                             suffixIcon: InkWell(
                               onTap: ()
                               {
                                 ChangePassCubit.get(context).showOldPassHide();
                               },
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 3.0),
                                 child: SvgPicture.asset(AssetsManager.iconEye,
                                   height: 11,
                                   width: 15,
                                 ),
                               ),
                             ),
                             validator: (value)
                             {
                               if (value!.isEmpty || ChangePassCubit.get(context).hasError) {
                                 return ChangePassCubit.get(context).validateMessage;
                               }
                               return null;
                             },
                             onChange: (value)
                             {
                               ChangePassCubit.get(context).changeColor(
                                 oldPass: value,
                                 newPass: newPass.text,
                                 confirmNewPass: newPassConfirm.text,
                               );
                             },
                           ),

                           const SizedBox(
                             height: 30,
                           ),

                           DefaultFormField(
                             isPassword: ChangePassCubit.get(context).newPassHide,
                             icon: SvgPicture.asset(AssetsManager.iconLock,
                               height: 15.79,
                               width: 13.82,
                             ),
                             hint: TranslationKeyManager.newPass.tr,
                             controller: newPass,
                             suffixIcon: InkWell(
                               onTap: ()
                               {
                                 ChangePassCubit.get(context).showPass(isNewPass: true);
                               },
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 3.0),
                                 child: SvgPicture.asset(AssetsManager.iconEye,
                                   height: 11,
                                   width: 15,
                                 ),
                               ),
                             ),
                             validator: (value)
                             {
                               if (value!.isEmpty || ChangePassCubit.get(context).hasError) {
                                 return ChangePassCubit.get(context).validateMessage;
                               }
                               return null;
                             },
                             onChange: (value)
                             {
                               ChangePassCubit.get(context).changeColor(
                                   oldPass: oldPass.text,
                                   newPass: value,
                                   confirmNewPass: newPassConfirm.text
                               );
                             },
                           ),

                           const SizedBox(
                             height: 30,
                           ),

                           DefaultFormField(
                             isPassword: ChangePassCubit.get(context).confirmHide,
                             icon: SvgPicture.asset(AssetsManager.iconLock,
                                 height: 15.79,
                                 width: 13.82
                             ),
                             hint: TranslationKeyManager.passwordConfirm.tr,
                             controller: newPassConfirm,
                             suffixIcon: InkWell(
                               onTap: ()
                               {
                                 ChangePassCubit.get(context).showPass(isNewPass: false);

                               },
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 3.0),
                                 child: SvgPicture.asset(AssetsManager.iconEye,
                                   height: 11,
                                   width: 15,
                                 ),
                               ),
                             ),
                             validator: (value)
                             {
                               if (value!.isEmpty || ChangePassCubit.get(context).hasError) {
                                 return ChangePassCubit.get(context).validateMessage;
                               }
                               return null;
                             },
                             onChange: (value)
                             {
                               ChangePassCubit.get(context).changeColor(
                                   oldPass: oldPass.text,
                                   newPass: newPass.text,
                                   confirmNewPass:value
                               );
                             },
                           ),

                           const SizedBox(
                             height: 40,
                           ),

                           state is ChangePassLoadingState?
                           const DefaultLoading() :
                           DefaultButton(
                               text: TranslationKeyManager.update.tr,
                               style: StyleManager.confirmButton,
                               background: ChangePassCubit
                                   .get(context)
                                   .color,
                               onPressed: ChangePassCubit
                                   .get(context)
                                   .color == ColorsManager.primaryColor ?
                                   () {
                                 ChangePassCubit.get(context).onPressed(
                                     context: context,
                                     oldPass: oldPass.text,
                                     newPass: newPass.text,
                                     newPassConfirm: newPassConfirm.text
                                 );
                               } : null
                           )
                         ],
                       ),
                     );
                   },
                   listener: (context, state){})
               ,
             )
         )
      ],
    );
  }
}

