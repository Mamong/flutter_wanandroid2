import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}

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
