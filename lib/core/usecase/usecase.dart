import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_wanandroid2/core/utils/typedefs.dart';


/// here we offer two usecase style: with exception or without exception
/// usecase without exception, that is, exception will be packed into the result
abstract class UsecaseWithParams<Typo, Params> {
  const UsecaseWithParams();

  ResultFuture<Typo> call(Params params);
}

abstract class UsecaseWithoutParams<Typo> {
  const UsecaseWithoutParams();

  ResultFuture<Typo> call();
}

/// usecase with exception, that is, exception will be thrown
abstract class UsecaseWithParamsExp<Typo, Params> {
  const UsecaseWithParamsExp();

  Future<Typo> call(Params params);
}

abstract class UsecaseWithoutParamsExp<Typo> {
  const UsecaseWithoutParamsExp();

  Future<Typo> call();
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
