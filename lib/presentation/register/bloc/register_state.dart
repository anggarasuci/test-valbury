part of 'register_bloc.dart';

@immutable
abstract class RegisterState {
  final String? errorEmail;
  final String? errorPhone;

  const RegisterState({required this.errorEmail, required this.errorPhone});
}

class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(errorEmail: null, errorPhone: null);
}

class RegistrationSuccess extends RegisterState {
  const RegistrationSuccess() : super(errorEmail: null, errorPhone: null);
}

class ValidationError extends RegisterState {
  const ValidationError({required String? email, required String? phone})
      : super(errorEmail: email, errorPhone: phone);
}

class RegisterNavigateLogin extends RegisterState {
  const RegisterNavigateLogin() : super(errorEmail: null, errorPhone: null);
}
