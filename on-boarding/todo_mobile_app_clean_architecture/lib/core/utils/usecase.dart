
import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call (Params params);
}

class Params<T> {
  final T data;
  Params(this.data);
}

class NoParams {
  final void data;
  NoParams(this.data);
}