import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickly_app/features/forgot_password/data/repos/forget_password_repo_implementation.dart';

import '../../../../../core/resources_manager/colors_manager.dart';
import 'send_code_states.dart';

class SendCodeCubit extends Cubit<SendCodeStates> {

  SendCodeCubit(this.forgotPasswordRepoImplementation) :
        super(SendCodeInitialState());

  final ForgotPasswordRepoImplementation forgotPasswordRepoImplementation;
  static SendCodeCubit get (context) => BlocProvider.of(context);

  String? validateMessage = 'من فضلك ادخل رقم الهاتف';
  var formKey = GlobalKey<FormState>();
  bool hasError = false;
  Future<void> sendCode ({
    required String phoneNumber,
  }) async
  {
    emit(SendCodeLoadingState());
    var response =
    await forgotPasswordRepoImplementation.sendCode
      (
        phone: forgotPasswordRepoImplementation.phone!
    );
    response.fold((failure)
    {
      emit(SendCodeErrorState(failure.errorMessage));
    }, (result) async
    {
      if(result.result!)
      {
        print("/////////55");
        print(result.content!.message);
        forgotPasswordRepoImplementation.codeAPI = '${result.content!.message}';
        print(forgotPasswordRepoImplementation.codeAPI);
        await fireBaseSendCode();
      }
      else
      {
        validateMessage = result.content!.message;
        hasError = true;
        formKey.currentState!.validate();
        emit(SendCodeSuccessErrorDataState(result.content!.message));
      }
    });
  }

  void onPressed
      ({
    required String phoneNumber,
  }) async
  {
    hasError = false;
    validateMessage = 'من فضلك ادخل رقم الهاتف';
    if (formKey.currentState!.validate()) {
      forgotPasswordRepoImplementation.phone  = phoneNumber;
      await sendCode(phoneNumber: phoneNumber);
    }
  }

  Color color = ColorsManager.secondary;
  void changeColor(String value)
  {
    if (value.length <11)
    {
      color = ColorsManager.secondary;
    }
    else
    {
      color = ColorsManager.primaryColor;
    }
    emit(SendCodeChangeColorState());
  }

  Future fireBaseSendCode()async
  {
    forgotPasswordRepoImplementation.auth = FirebaseAuth.instance;
    await forgotPasswordRepoImplementation.auth!.verifyPhoneNumber(
      phoneNumber: '+2${forgotPasswordRepoImplementation.phone}',
      codeSent: (String verificationId, int? resendToken) async {
        emit(SendCodeSuccessState());
        forgotPasswordRepoImplementation.verificationId = verificationId;
      }, verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error)
      {
        emit(SendCodeErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (String verificationId)
      {
       // emit(SendCodeErrorState("تاكد من الاتصال بالانترنت"));
      },
    );
  }

}