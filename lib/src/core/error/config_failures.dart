import 'package:equatable/equatable.dart';

abstract class ConfigFailure extends Equatable {
  const ConfigFailure();
}

class CacheFailure extends ConfigFailure {
  @override
  List<Object> get props => [];
}

class ServerFailure extends ConfigFailure {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends ConfigFailure {
  @override
  List<Object> get props => [];
}

class ValidationFailure extends ConfigFailure {
  final String message;

  const ValidationFailure(this.message);

  @override
  List<Object> get props => [message];
}
