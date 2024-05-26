import 'dart:async';

import 'package:flutter/material.dart';

part 'reactive_stream.dart';

part 'reactive_builder.dart';

part 'reactive_listener_interface.dart';

part 'reactive_subscriber.dart';

typedef SimpleStream<T extends Object> = SimpleReactiveStream<T>;

typedef NullableSimpleStream<T extends Object> = SimpleReactiveStream<T?>;

extension SrStreamSafe<T extends Object> on T {
  SimpleReactiveStream<T> get asStream => SimpleReactiveStream<T>(this);
}

extension SrStreamNullable<T extends Object?> on T {
  SimpleReactiveStream<T> get asStream => SimpleReactiveStream<T>(this);
}
