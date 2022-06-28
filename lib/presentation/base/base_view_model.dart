abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Shared Variables and Methods that will be used through any View Model.
}

// Inputs to this View Model.
abstract class BaseViewModelInputs {
  void start(); // View talks to ViewModel and tell him to start

  void dispose();
}

// Outputs of this View Model
abstract class BaseViewModelOutputs {}
