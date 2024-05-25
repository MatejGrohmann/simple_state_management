part of 'simple_reactive.dart';

class SimpleReactiveStream<T extends Object?> {
  T _value;

  final _streamController = StreamController<T>.broadcast();

  final List<_SimpleReactiveState> _parents = List.empty(growable: true);

  SimpleReactiveStream([T? value]) : _value = value ?? null as T;

  T get value {
    final parent = _SimpleReactiveState.proxy;
    if (parent != null && parent.canRegister && !_parents.contains(parent)) {
      _addParent(parent);
    }
    return _value;
  }

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _streamController.add(_value);
      for (var index = _parents.length - 1; index >= 0; index--) {
        final parent = _parents[index];
        if (parent._canUpdate) {
          parent._onUpdate();
        } else {
          _parents.removeAt(index);
        }
      }
    }
  }

  Stream<T?> get stream => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  _addParent(_SimpleReactiveState parent) {
    if (!_parents.contains(parent)) {
      _parents.add(parent);
    }
  }
}
