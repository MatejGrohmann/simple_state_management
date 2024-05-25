part of 'state_controller.dart';

abstract mixin class ScaffoldMessengerMixin {
  BuildContext get context;

  ScaffoldMessengerState? get scaffoldMessenger {
    return ScaffoldMessenger.maybeOf(context);
  }

  void showSnackBar(SnackBar snackBar) {
    scaffoldMessenger?.hideCurrentSnackBar();
    scaffoldMessenger?.showSnackBar(snackBar);
  }
}

abstract mixin class NavigatorMixin {
  BuildContext get context;

  NavigatorState? get navigator {
    return Navigator.maybeOf(context);
  }
}