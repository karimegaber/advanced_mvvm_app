import 'package:advanced_app/data/network/failure.dart';
import 'package:advanced_app/data/network/requests.dart';
import 'package:advanced_app/domain/models/login_models.dart';
import 'package:advanced_app/domain/repository/repository.dart';
import 'package:advanced_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginRequest,Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginRequest input) async {
    return await _repository.login(input); ///TODO: maybe error here ( TAKE CAREEEE ).
  }

}