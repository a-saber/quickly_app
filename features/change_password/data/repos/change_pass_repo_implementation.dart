
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickly_app/core/dio_helper/dio_helper.dart';
import 'package:quickly_app/core/dio_helper/end_points.dart';
import 'package:quickly_app/core/errors/failures.dart';
import 'package:quickly_app/features/change_password/data/models/change_pass_response.dart';
import 'change_pass_repo.dart';
String token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd3d3LnF1aWNrbHktZWd5cHQuY29tXC9hcGlcL3YxXC9jb21wYW55XC9hdXRoXC9sb2dpbiIsImlhdCI6MTY4NzM2MDY5NSwiZXhwIjo1Mjg3MzYwNjk1LCJuYmYiOjE2ODczNjA2OTUsImp0aSI6Ikk5MFdlbDZ2T0dCaXpRUHgiLCJzdWIiOjQxLCJwcnYiOiJjZmU3ZWM5OWEyM2Y0Mzg4ZTdmMWQ1ZmI4NzA4Mzc1Yzg1NGVkYTY0In0.kPcM-YPJglS_fhr-Dy2WSONSh98ZMhEF2sB0_bImlx0';
class ChangePassRepoImplementation extends ChangePassRepo
{

  @override
  Future<Either<Failure, ChangePassResponse>> changePassword({
    required String oldPass,
    required String newPass,
  }) async
  {
    try {
      var data = await DioHelper.postDate(
          endPoint: EndPoints.changePass,
          query:
          {
            'old_password': oldPass,
            'new_password' : newPass
          },
        data:
        {
          'Authorization' : 'token=$token'
        }

      );
      print(data.data.toString());
      return right(ChangePassResponse.fromJson(data.data));
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



}