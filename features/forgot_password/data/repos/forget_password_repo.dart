import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickly_app/features/forgot_password/data/models/code_response.dart';

import '../../../../core/errors/failures.dart';

abstract class ForgotPasswordRepo
{
  String? phone;
  String? codeAPI;
  String? verificationId;
  FirebaseAuth? auth;
  Future<Either<Failure, CodeResponse>> sendCode({required String phone});
  Future<Either<Failure, CodeResponse>> verifyCode({required String code, required String phone});
  Future<Either<Failure, CodeResponse>> changeForgottenPassword({required String password, required String phone});
}