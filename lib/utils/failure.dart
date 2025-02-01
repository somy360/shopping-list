// Flutter imports:
import 'package:flutter/foundation.dart';

/// Represents an expected error
@immutable
class Failure implements Exception {
  /// A human-readable error message
  final String message;

  final Map<String, dynamic>? errors;

  const Failure(this.message, {this.errors});

  @override
  bool operator ==(dynamic other) =>
      (other is Failure) && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
