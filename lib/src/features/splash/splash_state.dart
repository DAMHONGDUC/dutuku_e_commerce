part of 'splash_controller.dart';

@immutable
sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => const [];
}

final class SplashInitialState extends SplashState {}

final class LoggedInLState extends SplashState {}

final class NotLogInLState extends SplashState {}
