import 'package:advanced_app/data/data_source/remote_data_source.dart';
import 'package:advanced_app/data/mapper/mapper.dart';
import 'package:advanced_app/data/network/failure.dart';
import 'package:advanced_app/data/network/network_info.dart';
import 'package:advanced_app/data/network/requests.dart';
import 'package:advanced_app/domain/models/login_models.dart';
import 'package:advanced_app/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    // Internet is connected.
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        //Success
        return Right(response.toDomain());
      } else {
        //Failure
        return Left(Failure(
            response.status ?? 400, response.message ?? 'An Error happened!'));
      }
    }
    // Internet is NOT connected.
    else {
      return Left(Failure(400, 'An Error happened!'));
    }
  }
}
