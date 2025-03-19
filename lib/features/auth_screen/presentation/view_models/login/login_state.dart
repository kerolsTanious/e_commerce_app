abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginLoading extends LoginState {}
