import 'package:dartz/dartz.dart';
import 'package:network/network.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<ServerException, T>>;


mixin ResultExt{
  ResultFuture<T> guard<T>(Future<T> Function() future) async {
    try {
      return Right(await future());
    } on ServerException catch (err, stack) {
      return Left(err);
    }
  }
}