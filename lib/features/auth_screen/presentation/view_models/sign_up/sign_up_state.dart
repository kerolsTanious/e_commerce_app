abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String token;

  SignUpSuccess({required this.token});
}

final class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class SignUpLoading extends SignUpState {}
