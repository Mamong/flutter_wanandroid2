import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    if(kDebugMode){
      return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
    }else{
      return 'message=$message($statusCode)';
    }
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => -100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}