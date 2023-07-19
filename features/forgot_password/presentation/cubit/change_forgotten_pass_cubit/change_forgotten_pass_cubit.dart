import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickly_app/features/forgot_password/data/repos/forget_password_repo_implementation.dart';

import '../../../../../core/resources_manager/colors_manager.dart';
import 'change_forgotten_pass_states.dart';

class ChangeForgottenPassCubit extends Cubit<ChangeForgottenPassStates> {

  ChangeForgottenPassCubit(this.forgotPasswordRepoImplementation) :
        super(ChangeForgottenPassInitialState());

  final ForgotPasswordRepoImplementation forgotPasswordRepoImplementation;
  static ChangeForgottenPassCubit get (context) => BlocProvider.of(context);

  String? validateMessage = 'من فضلك ادخل رقم الهاتف';
  var formKey = GlobalKey<FormState>();
  bool hasError = false;

  Future<void> changeForgotPassword ({
    required String password
  }) async
  {
    emit(ChangeForgottenPassLoadingState());
    print(forgotPasswordRepoImplementation.phone!);
    print(password);
    var response =
    await forgotPasswordRepoImplementation.changeForgottenPassword
      (
        password: password,
        phone: forgotPasswordRepoImplementation.phone!
      );
    response.fold((failure)
    {
      emit(ChangeForgottenPassErrorState(failure.errorMessage));
    }, (result)
    {
      if(result.result!)
      {
        emit(ChangeForgottenPassSuccessState());
      }
      else
      {

      }
    });
  }


  void onPressed
      ({
    required String pass,
    required String confirm,
  }) async
  {
    hasError = false;
    validateMessage = 'من فضلك ادخل رقم سري لا يقل عن 8 احرف وارقام';
    if (formKey.currentState!.validate() && pass == confirm) {
      await changeForgotPassword(password: pass);
    }
  }

  Color color = ColorsManager.secondary;
  void changeColor({ required String pass, required String confirm})
  {
    if (pass == confirm && pass.length >=8)
    {
      color = ColorsManager.primaryColor;
    }
    else
    {
      color = ColorsManager.secondary;
    }
    emit(ChangeForgottenPassChangeColorState());
  }

  bool passHide= true;
  bool confirmHide= true;
  void showPass({required bool isPass})
  {
    if (isPass)
    {
      passHide = !passHide;
    }
    else
    {
      confirmHide = ! confirmHide;
    }
    emit(ChangeForgottenPassChangeHideState());

  }

}