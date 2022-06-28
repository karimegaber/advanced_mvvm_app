import 'dart:async';
import 'package:advanced_app/domain/models.dart';
import 'package:advanced_app/presentation/base/base_view_model.dart';
import 'package:advanced_app/presentation/resources/assets_manager.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderList;
  int currentIndex = 0;

  // View Model [ Inputs ]
  @override
  void dispose() {
    _streamController.close(); // Here I close or dispose the StreamController.
  }

  @override
  void start() {
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  int goNextPage() {
    int nextIndex = currentIndex + 1;
    if (nextIndex == _sliderList.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPreviousPage() {
    int previousIndex = currentIndex - 1;
    if (previousIndex == -1) {
      previousIndex = _sliderList.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // View Model [ Outputs ]
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream
          .map((sliderViewController) => sliderViewController);

  List<SliderObject> _getSliderData() => [
        SliderObject(
          StringsManager.onBoardingTitle1,
          StringsManager.onBoardingSubtitle1,
          ImageAssets.onBoardingImage1,
        ),
        SliderObject(
          StringsManager.onBoardingTitle2,
          StringsManager.onBoardingSubtitle2,
          ImageAssets.onBoardingImage2,
        ),
        SliderObject(
          StringsManager.onBoardingTitle3,
          StringsManager.onBoardingSubtitle3,
          ImageAssets.onBoardingImage3,
        ),
        SliderObject(
          StringsManager.onBoardingTitle4,
          StringsManager.onBoardingSubtitle4,
          ImageAssets.onBoardingImage4,
        ),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
          _sliderList[currentIndex], _sliderList.length, currentIndex),
    );
  }
}

abstract class OnBoardingViewModelInputs {
  int goNextPage(); // When clicking the right arrow
  int goPreviousPage(); // When clicking the left arrow
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
