part of 'controller.dart';

/// Controller Interface represents the lifecycle of a controller
/// Controller gives you same functionality as an stateful widget
abstract interface class IControllerInterface {
  /// Called with the [onInit] method of the state
  void onInit();

  /// Called immediately and only after [onInit] method is called
  /// widget is already mounted here, you can play with context
  void onReady();

  /// Called when the state is removed from the tree
  /// dispose everything you create inside of the controller here
  void onDispose();

  /// same as setState inside that stateful widget however
  /// you don't have to pass any function, it will just manually rebuild the state
  void setState();

  /// get context of the stateful widget controller lives in
  /// useful for navigation, dialogs, snackBars, etc
  BuildContext get context;

  /// check if the controller onReady method was executed
  bool get isReady;

  /// check if the controller onDispose method was executed
  bool get isDisposed;

  /// check if the controller onInit method was executed
  bool get isInitialized;

  bool get isMounted;
}
