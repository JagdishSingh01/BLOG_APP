import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Parameters> {
  Future<Either<Failure, SuccessType>> call(Parameters params);
}
class NoParams{}