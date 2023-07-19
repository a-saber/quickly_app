import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/features/forgot_password/data/repos/forget_password_repo_implementation.dart';

import 'verify_code_states.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {

  VerifyCodeCubit(this.forgotPasswordRepoImplementation) :
        super(VerifyCodeInitialState());

  final ForgotPasswordRepoImplementation forgotPasswordRepoImplementation;
  static VerifyCodeCubit get (context) => BlocProvider.of(context);



  bool complete = false;
  String? pinPutCode;
  void onChangePinPut(String value)
  {
    if (value.length ==6)
    {
      complete = true;
      pinPutCode = value;
    }
    else
    {
      complete = false;
    }
    emit(VerifyCodeColorChangeState());

  }

  Color color = ColorsManager.secondary;
  Future<void> verifyCode () async
  {

    color = ColorsManager.primaryColor;
    emit(VerifyCodeLoadingState());
    var response =
    await forgotPasswordRepoImplementation.verifyCode
      (
        code: forgotPasswordRepoImplementation.codeAPI!,
        phone: forgotPasswordRepoImplementation.phone!
    );

    response.fold((failure)
    {
      emit(VerifyCodeErrorState(failure.errorMessage));
    }, (result) async
    {
      if(result.result!)
      {
        await firebaseVerify();
      }
      else
      {
        emit(VerifyCodeErrorState(result.content!.message));
      }
    });
  }

  Future firebaseVerify()async
  {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: forgotPasswordRepoImplementation.verificationId!,
        smsCode: pinPutCode!
    );
    await forgotPasswordRepoImplementation.auth!.signInWithCredential(credential).
    then((value) async
    {
      emit(VerifyCodeSuccessState());
    })
    .catchError((error)
    {
      emit(VerifyCodeErrorState("الكود غير صحيح من فضلك تأكد من رقم الهاتف"));
    });
  }

}