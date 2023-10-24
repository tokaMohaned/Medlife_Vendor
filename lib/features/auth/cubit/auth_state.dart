abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class EmailVerifyRequestSentLoading extends AuthState {}

class EmailVerifyRequestSentSuccess extends AuthState {}

class EmailVerifyRequestSentError extends AuthState {
  final String message;

  EmailVerifyRequestSentError(this.message);
}

class PasswordResetRequestSent extends AuthState {}

class LoggedOut extends AuthState {}
