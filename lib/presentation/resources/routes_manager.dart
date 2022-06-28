import 'package:advanced_app/presentation/forget_password/forget_password_view.dart';
import 'package:advanced_app/presentation/home/home_view.dart';
import 'package:advanced_app/presentation/login/login_view.dart';
import 'package:advanced_app/presentation/onboarding/view/onboarding_view.dart';
import 'package:advanced_app/presentation/register/register_view.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';
import 'package:advanced_app/presentation/splash/splash_view.dart';
import 'package:advanced_app/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreenRoute = '/';
  static const String onboardingScreenRoute = '/on_boarding';
  static const String loginScreenRoute = '/login';
  static const String registerScreenRoute = '/register';
  static const String forgetPasswordScreenRoute = '/forget_password';
  static const String homeScreenRoute = '/home';
  static const String storeDetailsScreenRoute = '/store_details';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
        );
      case Routes.onboardingScreenRoute:
        return MaterialPageRoute(
          builder: (_) => OnBoardingView(),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );
      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordView(),
        );
      case Routes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case Routes.storeDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => StoreDetailsView(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteFound),
          ),
          body: const Center(
            child: Text(StringsManager.noRouteFoundErrorMessage),
          ),
        ),
      );
}
