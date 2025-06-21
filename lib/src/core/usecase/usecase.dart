import 'package:dartz/dartz.dart';
import 'package:dutuku_e_commerce/src/core/error/config_failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ConfigFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
