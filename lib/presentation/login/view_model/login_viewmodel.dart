import 'dart:async';
import 'dart:developer';

import 'package:advanced_app/data/network/requests.dart';
import 'package:advanced_app/domain/usecase/login_usecase.dart';
import 'package:advanced_app/presentation/base/base_view_model.dart';
import 'package:advanced_app/presentation/common/freezed_data_class.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // broadcast constructor allows the stream controller to have many listeners.
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _loginButtonStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  // final LoginUseCase _loginUseCase;
  //
  // LoginViewModel(this._loginUseCase);

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputLoginButtonStatus => _loginButtonStreamController.sink;

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username));

  @override
  Stream<bool> get outputLoginButtonStatus =>
      _loginButtonStreamController.stream.map((_) => _areAllValid());

  @override
  void start() {}

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
    _loginButtonStreamController.close();
  }

  @override
  login() async {
    // (await _loginUseCase
    //         .execute(LoginRequest(loginObject.username, loginObject.password)))
    //     .fold(
    //   (failure) => {log(failure.message)},
    //   (data) => {log(data.customer?.name ?? 'No name yet')},
    // );
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputLoginButtonStatus.add(null);
  }

  @override
  void setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    inputLoginButtonStatus.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _areAllValid() {
    return _isUsernameValid(loginObject.username) &&
        _isPasswordValid(loginObject.password);
  }
}

abstract class LoginViewModelInputs {
  void setUsername(String username);

  void setPassword(String password);

  login();

  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputLoginButtonStatus;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputLoginButtonStatus;
}
