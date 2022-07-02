import 'package:advanced_app/presentation/login/view_model/login_viewmodel.dart';
import 'package:advanced_app/presentation/resources/assets_manager.dart';
import 'package:advanced_app/presentation/resources/colors_manager.dart';
import 'package:advanced_app/presentation/resources/fonts_manager.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';
import 'package:advanced_app/presentation/resources/styles_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:advanced_app/presentation/reusable_components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _usernameController
        .addListener(() => _viewModel.setUsername(_usernameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s100.h,
              ),

              /// Logo Image
              Center(child: Image.asset(ImageAssets.splashScreenLogo)),

              /// Username Field
              CustomTextField(
                label: StringsManager.username,
                errorText: StringsManager.usernameError,
                stream: _viewModel.outputIsUsernameValid,
                inputType: TextInputType.emailAddress,
                controller: _usernameController,
              ),

              /// Password Field
              CustomTextField(
                label: StringsManager.password,
                errorText: StringsManager.passwordError,
                stream: _viewModel.outputIsPasswordValid,
                inputType: TextInputType.visiblePassword,
                controller: _passwordController,
              ),

              SizedBox(height: AppSize.s28.h),

              /// Login Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputLoginButtonStatus,
                  builder: (context, snapshot) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          //style: ElevatedButton.styleFrom(si),
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p12.h),
                            child: Text(
                              StringsManager.login,
                              style: getBoldStyle(
                                  color: (snapshot.data ?? false)
                                      ? ColorsManager.white
                                      : ColorsManager.grey,
                                  fontSize: FontSize.s20.sp),
                            ),
                          )),
                    );
                  },
                ),
              ),

              ///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        StringsManager.forgotPassword,
                        style: getSemiBoldStyle(
                          color: ColorsManager.primary,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text(
                        StringsManager.registerText,
                        style: getSemiBoldStyle(
                          color: ColorsManager.primary,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }
}
