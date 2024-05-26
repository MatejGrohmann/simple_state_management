part of 'reactive.dart';

abstract interface class ReactiveListenerInterface {
  @protected
  static ReactiveListenerInterface? proxy;

  void onUpdate();

  bool get canUpdate;

  bool get canRegister;
}