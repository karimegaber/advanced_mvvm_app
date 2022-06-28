import 'package:advanced_app/app/constants.dart';
import 'package:advanced_app/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.loginUrl)
  Future<AuthenticationResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );
}
