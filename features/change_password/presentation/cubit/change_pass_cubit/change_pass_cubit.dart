import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickly_app/core/core_widgets/my_snack_bar.dart';
import 'package:quickly_app/features/change_password/data/repos/change_pass_repo_implementation.dart';

import '../../../../../core/resources_manager/colors_manager.dart';
import 'change_pass_states.dart';

class ChangePassCubit extends Cubit<ChangePassStates> {

  ChangePassCubit(this.repo) :
        super(ChangePassInitialState());

  final ChangePassRepoImplementation repo;
  static ChangePassCubit get (context) => BlocProvider.of(context);

  String? validateMessage = 'من فضلك ادخل رقم سري لا يقل عن 8 احرف وارقام';
  var formKey = GlobalKey<FormState>();
  bool hasError = false;

  Future<void> changePassword ({
    required context,
    required String oldPass,
    required String newPass
  }) async
  {
    emit(ChangePassLoadingState());
    var response = await repo.changePassword(
        oldPass: oldPass,
        newPass: newPass
    );
    response.fold((failure)
    {
      emit(ChangePassErrorState(failure.errorMessage));
      callMySnackBar(context: context, text: failure.errorMessage);

    }, (result)
    {
      if(result.result!)
      {
        emit(ChangePassSuccessState());
        callMySnackBar(context: context, text: result.content!.message!);
      }
      else
      {
        emit(ChangePassErrorState(result.content!.message!));
        callMySnackBar(context: context, text: result.content!.message!);
      }
    });
  }


  void onPressed
      ({
    required context,
    required String oldPass,
    required String newPass,
    required String newPassConfirm,
  }) async
  {
    hasError = false;
    validateMessage = 'من فضلك ادخل رقم سري لا يقل عن 8 احرف وارقام';
    if (formKey.currentState!.validate()) {
      await changePassword(context: context,oldPass: oldPass, newPass: newPass);
    }
  }

  Color color = ColorsManager.secondary;
  void changeColor({ required String oldPass, required String newPass, required String confirmNewPass,})
  {
    if (newPass == confirmNewPass && confirmNewPass.length >=8 && oldPass.length >=8)
    {
      color = ColorsManager.primaryColor;
    }
    else
    {
      color = ColorsManager.secondary;
    }
    emit(ChangePassChangeColorState());
  }

  bool oldPassHide= true;
  bool newPassHide= true;
  bool confirmHide= true;
  void showOldPassHide()
  {
    oldPassHide = ! oldPassHide;
    emit(ChangePassChangeHideState());
  }
  void showPass({ required bool isNewPass,})
  {
    if (isNewPass)
    {
      newPassHide = !newPassHide;
    }
    else
    {
      confirmHide = ! confirmHide;
    }
    emit(ChangePassChangeHideState());

  }

}