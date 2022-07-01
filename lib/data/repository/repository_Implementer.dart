import 'package:advanced_app/data/data_source/remote_data_source.dart';
import 'package:advanced_app/data/mapper/mapper.dart';
import 'package:advanced_app/data/network/error_handler.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          //Success
          return Right(response.toDomain());
        } else {
          //Failure
          return Left(Failure(
            ApiInternalStatus.FAILURE,
            response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        // if an error happened.
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    // Internet is NOT connected.
    else {
      return Left(DataSource.NOT_INTERNET_CONNECTION.getFailure());
    }
  }
}
