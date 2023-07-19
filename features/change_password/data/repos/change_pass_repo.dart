import 'package:dartz/dartz.dart';
import 'package:quickly_app/features/change_password/data/models/change_pass_response.dart';

import '../../../../core/errors/failures.dart';

abstract class ChangePassRepo
{
  Future<Either<Failure, ChangePassResponse>>
  changePassword({
    required String oldPass,
    required String newPass
  });
}