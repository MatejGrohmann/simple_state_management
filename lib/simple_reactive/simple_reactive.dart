import 'dart:async';

import 'package:flutter/material.dart';

part 'simple_reactive_stream.dart';

part 'simple_reactive_builder.dart';

typedef SrStream<T extends Object> = SimpleReactiveStream<T>;

typedef SrnStream<T extends Object> = SimpleReactiveStream<T?>;

extension SrStreamSafe<T extends Object> on T {
  SimpleReactiveStream<T> get asStream => SimpleReactiveStream<T>(this);
}

extension SrStreamNullable<T extends Object?> on T {
  SimpleReactiveStream<T> get asStream => SimpleReactiveStream<T>(this);
}

