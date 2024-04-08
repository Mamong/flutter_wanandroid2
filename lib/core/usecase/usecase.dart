import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';


/// here we offer two usecase style: with exception or without exception
/// usecase without exception, that is, exception will be packed into the result
abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}

/// usecase with exception, that is, exception will be thrown
abstract class UsecaseWithParamsExp<Type, Params> {
  const UsecaseWithParamsExp();

  Future<Type> call(Params params);
}

abstract class UsecaseWithoutParamsExp<Type> {
  const UsecaseWithoutParamsExp();

  Future<Type> call();
}

class PaginatedParams extends Equatable {
  final int page;
  final int pageSize;

  const PaginatedParams({
    required this.page,
    required this.pageSize,
  });

  @override
  List<Object?> get props => [page, pageSize];
}
