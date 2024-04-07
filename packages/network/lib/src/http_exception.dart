import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum ErrorType {
  businessFailed(-1),
  notLogin(-1001),
  none(0),
  httpException(1),
  cacheError(10),
  unknown(99);

  final int code;

  const ErrorType(this.code);
}

class ServerException extends Equatable implements Exception {
  final String message;
  final ErrorType statusCode;
  final String identifier;

  const ServerException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  @override
  List<Object> get props => [message, statusCode, identifier];

  @override
  String toString() {
    if (kDebugMode) {
      return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
    } else {
      return 'message=$message($statusCode)';
    }
  }
}

class CacheFailureException extends Equatable implements ServerException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  ErrorType get statusCode => ErrorType.cacheError;

  @override
  List<Object> get props => [message, statusCode, identifier];
}
