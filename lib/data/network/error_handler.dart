import 'package:advanced_app/data/network/failure.dart';
import 'package:dio/dio.dart';

// Error Handling class
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleDioError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

// Method to handle errors caused by Dio or the API and return a Failure object.
Failure _handleDioError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          error.response?.statusCode ?? 0,
          error.response?.statusMessage ?? '',
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}

// Different types of errors.
enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NOT_INTERNET_CONNECTION,
  DEFAULT,
}

// Code for every error
class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected the request.
  static const int FORBIDDEN = 403; // API rejected the request.
  static const int NOT_FOUND = 404; // Not found
  static const int UNAUTHORIZED = 401; // failure, user is not authorized.
  static const int INTERNAL_SERVER_ERROR =
      500; // Failure, crash in server side.
  //static const int NOT_FOUND = 200; //

  // Local Status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NOT_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7; // unknown error.
}

// Default message for every error
class ResponseMessage {
  static const String SUCCESS = 'Success';
  static const String NO_CONTENT = 'Success, but no content!';
  static const String BAD_REQUEST = 'Bad request, Try again later.';
  static const String FORBIDDEN = 'Forbidden request, Try again later.';
  static const String UNAUTHORIZED = 'User is not authorized!';
  static const String NOT_FOUND = 'Something went wrong, Try again later.';
  static const String INTERNAL_SERVER_ERROR =
      'Something went wrong, Try again later.';

  // Local Status code
  static const String CONNECT_TIMEOUT = 'Timeout error, Try again later.';
  static const String CANCEL = 'Request was canceled, Try again later.';
  static const String RECIEVE_TIMEOUT = 'Timeout error, Try again later.';
  static const String SEND_TIMEOUT = 'Timeout error, Try again later.';
  static const String CACHE_ERROR = 'Cache error, Try again later.';
  static const String NOT_INTERNET_CONNECTION =
      'Please check your internet connection.';
  static const String DEFAULT = 'Something went wrong, Try again later.';
}

// Extension to return Failure object depending of the type of error.
extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NOT_INTERNET_CONNECTION:
        return Failure(ResponseCode.NOT_INTERNET_CONNECTION,
            ResponseMessage.NOT_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}
