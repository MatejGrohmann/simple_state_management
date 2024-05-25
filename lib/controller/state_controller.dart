import 'package:flutter/material.dart';

part 'state_controller_interface.dart';

part 'state_controller_provider.dart';

part 'state_controller_utils.dart';

part 'state_controller_inherited_widget.dart';

part 'state_controller_extensions.dart';

part 'state_controller_view.dart';

class StateController with ScaffoldMessengerMixin, NavigatorMixin implements IStateControllerInterface {
  BuildContext? _context;
  VoidCallback? _setStateCallback;
  bool? _isReady;
  bool? _isDisposed;
  bool? _isInitialized;

  @override
  @mustCallSuper
  void onInit() {
    _isInitialized = true;
  }

  @override
  @mustCallSuper
  void onReady() {
    _isReady = true;
  }

  @override
  @mustCallSuper
  void onDispose() {
    _context = null;
    _isReady = null;
    _isInitialized = null;
    _isDisposed = true;
  }

  @override
  void setState() {
    _setStateCallback?.call();
  }

  @protected
  void inject(BuildContext context, VoidCallback callback) {
    _context = context;
    _setStateCallback = callback;
  }

  @override
  BuildContext get context {
    assert(_context != null, 'Context is not available because it was not provided yet from the state');
    assert(isReady, 'Context is not available because the controller is not ready');
    assert(!isDisposed, 'Context is not available because the controller is disposed');
    return scaffoldKey.currentContext ?? _context!;
  }

  @override
  bool get isDisposed => _isDisposed ?? false;

  @override
  bool get isInitialized => _isInitialized ?? false;

  @override
  bool get isReady => _isReady ?? false;

  @override
  bool get isMounted => isReady && context.mounted && !isDisposed;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}
