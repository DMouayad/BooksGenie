import 'dart:async';

import 'package:books_genie/support/result/result.dart';

extension ListExtensions<T> on List<T> {
  List<String> toStringList() {
    final l = <String>[];
    for (var i in this) {
      l.add(i.toString());
    }
    return l;
  }

  void addIfNotPresent(value) {
    if (!contains(value)) {
      add(value);
    }
  }

  bool hasType(Type type) {
    return where((element) => element.runtimeType == type).isNotEmpty;
  }

  T firstWhereType(Type type) {
    return (this).whereType().first;
  }

  T? firstWhereOrNull(bool Function(T element) condition) {
    try {
      return (this).where((e) => condition(e)).first;
    } on StateError {
      return null;
    }
  }

  T? firstWhereAnyOrNull(List<bool> Function(T element) conditions) {
    try {
      return (this).firstWhere((T e) {
        for (bool cond in conditions(e)) {
          if (cond) return cond;
        }
        return false;
      });
    } on StateError {
      return null;
    }
  }
}

extension MapKeys on Map {
  T? whereKey<T>(String key) {
    if (containsKey(key)) {
      return this[key];
    }
    return null;
  }
}

extension IterableExtension on Iterable {
  get firstOrNull {
    try {
      return first;
    } on StateError {
      return null;
    }
  }
}

extension StreamSinkResultExtension<V, E extends AppError> on StreamSink<V> {
  void fromResult(Result<V, E> result) {
    result.fold(
      ifFailure: (error) => addError(error),
      ifSuccess: (value) => add(value),
    );
  }
}
