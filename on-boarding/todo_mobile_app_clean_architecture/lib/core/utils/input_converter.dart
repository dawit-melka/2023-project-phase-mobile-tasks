import 'package:dartz/dartz.dart';
import 'package:todo_mobile_app_clean_architecture/core/errors/failure.dart';

class InputConverter {
  Either<Failure, DateTime> stringToDateTime(String str) {
    try {
      final dateTime = DateTime.parse(str);
      return Right(dateTime);
    } on FormatException {
      return Left(InvalidInputFailure());
    }

  }
}
