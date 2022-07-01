import 'package:advanced_app/data/network/failure.dart';
import 'package:advanced_app/data/network/requests.dart';
import 'package:advanced_app/domain/models/login_models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
