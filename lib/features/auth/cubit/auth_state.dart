abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class VerifyPhoneNumberLoading extends AuthState {}

class PhoneNumberVerified extends AuthState {}

class PasswordResetRequestSent extends AuthState {}

class LoggedOut extends AuthState {}
