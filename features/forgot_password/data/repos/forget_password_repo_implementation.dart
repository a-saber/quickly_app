
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickly_app/core/dio_helper/dio_helper.dart';
import 'package:quickly_app/core/dio_helper/end_points.dart';
import 'package:quickly_app/core/errors/failures.dart';
import 'package:quickly_app/features/forgot_password/data/models/code_response.dart';
import 'forget_password_repo.dart';

class ForgotPasswordRepoImplementation extends ForgotPasswordRepo
{

  @override
  Future<Either<Failure, CodeResponse>> changeForgottenPassword({
    required String password,
    required String phone
  }) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.resetForgotPassword,
          query: {
            'phone': phone,
            'password' : password
          }
      );
      print(data.data.toString());
      return right(CodeResponse.fromJson(data.data));
    }
    catch (e) {
      print("object");
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CodeResponse>>
  sendCode({required String phone}) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.sendCode,
          query: {
            'phone': phone
          }
      );
      print(data.data.toString());
      return right(CodeResponse.fromJson(data.data));
    } catch (e) {
      print("object");
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CodeResponse>> verifyCode({
    required String code,
    required String phone
  }) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.verifyCode,
          query: {
            'phone': phone,
            'code' : code
          }
      );
      print(data.data.toString());
      return right(CodeResponse.fromJson(data.data));
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}