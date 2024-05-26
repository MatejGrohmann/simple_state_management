part of 'reactive.dart';

class SimpleReactiveStream<T extends Object?> {
  T _value;

  final _streamController = StreamController<T>.broadcast();

  Stream<T> get stream => _streamController.stream;

  final List<ReactiveListenerInterface> _parents = List.empty(growable: true);

  SimpleReactiveStream([T? value]) : _value = value ?? null as T;

  T get value {
    final parent = ReactiveListenerInterface.proxy;
    if (parent != null && parent.canRegister && !_parents.contains(parent)) {
      _parents.add(parent);
    }

    return _value;
  }

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      refresh();
    }
  }

  void refresh() {
    _streamController.add(_value);
    for (var index = _parents.length - 1; index >= 0; index--) {
      final parent = _parents[index];
      if (parent.canUpdate) {
        parent.onUpdate();
      } else {
        _parents.removeAt(index);
      }
    }
  }

  void dispose() {
    _streamController.close();
  }
}
