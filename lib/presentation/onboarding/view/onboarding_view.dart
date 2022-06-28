import 'package:advanced_app/domain/models/slider_object.dart';
import 'package:advanced_app/domain/models/slider_view_object.dart';
import 'package:advanced_app/presentation/onboarding/view_model/onboarding_viewmodel.dart';
import 'package:advanced_app/presentation/resources/assets_manager.dart';
import 'package:advanced_app/presentation/resources/colors_manager.dart';
import 'package:advanced_app/presentation/resources/constants_manager.dart';
import 'package:advanced_app/presentation/resources/routes_manager.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  // binding view model with view.
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose(); // dispose the view model.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const Scaffold(
        backgroundColor: ColorsManager.primary,
        body: Center(
          child: CircularProgressIndicator(color: ColorsManager.lightGrey),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: AppBar(
          backgroundColor: ColorsManager.white,
          elevation: AppSize.s0.r,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: ColorsManager.white,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorsManager.white,
          height: AppSize.s100.h,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    StringsManager.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginScreenRoute);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: ColorsManager.primary,
                  child: _bottomSheetWidget(sliderViewObject),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _bottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s40.h,
              width: AppSize.s40.w,
              child: SvgPicture.asset(ImageAssets.leftArrowIcon),
            ),
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPreviousPage(),
                duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationDuration),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8.r),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s40.h,
              width: AppSize.s40.w,
              child: SvgPicture.asset(ImageAssets.rightArrowIcon),
            ),
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNextPage(),
                duration: const Duration(
                    milliseconds: AppConstants.sliderAnimationDuration),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  // Specifies which circle should be holo ( which is selected )
  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.holoCircleIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIcon);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s40.h),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8.r),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s40.h),
        SvgPicture.asset(_sliderObject.image, fit: BoxFit.fill),
      ],
    );
  }
}
