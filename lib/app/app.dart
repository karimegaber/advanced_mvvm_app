import 'package:advanced_app/presentation/resources/constants_manager.dart';
import 'package:advanced_app/presentation/resources/routes_manager.dart';
import 'package:advanced_app/presentation/resources/themes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  // Named Constructor.
  const MyApp._internal();

  // Create a private instance of this named constructor.
  static const MyApp _instance = MyApp._internal();

  // Factory to return the instance of the private named constructor.
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.appScreenWidth, AppConstants.appScreenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationLightTheme(),
          initialRoute: Routes.splashScreenRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
