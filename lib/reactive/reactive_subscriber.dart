part of 'reactive.dart';

class ReactiveSubscriber<T extends Object?> {
  final void Function(T previous, T current) onUpdate;

  late StreamSubscription<T> _subscription;
  late T _previousValue;

  ReactiveSubscriber({required this.onUpdate, required SimpleReactiveStream<T> reactiveValue}) {
    _previousValue = reactiveValue.value;
    _subscription = reactiveValue.stream.listen((value) {
      onUpdate(_previousValue, value);
      _previousValue = value;
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
