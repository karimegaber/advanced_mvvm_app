import 'dart:async';

import 'package:advanced_app/presentation/resources/constants_manager.dart';
import 'package:advanced_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends SplashViewModelInputs
    with SplashViewModelOutputs {
  final StreamController _streamController = StreamController<Timer>();
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    _streamController.close();
  }

  @override
  void start(BuildContext context) {
    _startDelay(context);
  }

  _navigateToNextPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Routes.onboardingScreenRoute);
  }

  _startDelay(context) {
    _timer = Timer(
      const Duration(seconds: AppConstants.splashDelay),
      () => _navigateToNextPage(context),
    );
  }

  @override
  Sink get splashViewModelInputs => _streamController.sink;

  @override
  Stream<Timer> get splashViewModelOutputs =>
      _streamController.stream.map((event) => event);
}

abstract class SplashViewModelInputs {
  void start(BuildContext context);

  void dispose();

  Sink get splashViewModelInputs;
}

abstract class SplashViewModelOutputs {
  Stream<Timer> get splashViewModelOutputs;
}
