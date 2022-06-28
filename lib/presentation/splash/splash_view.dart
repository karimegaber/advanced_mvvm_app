import 'package:advanced_app/presentation/resources/assets_manager.dart';
import 'package:advanced_app/presentation/resources/colors_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:advanced_app/presentation/splash/view_model/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _viewModel = SplashViewModel();

  @override
  void initState() {
    _viewModel.start(context);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        elevation: AppSize.s0.r,
        backgroundColor: ColorsManager.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(ImageAssets.splashScreenLogo),
            const CircularProgressIndicator(color: ColorsManager.grey),
          ],
        ),
      ),
    );
  }
}
