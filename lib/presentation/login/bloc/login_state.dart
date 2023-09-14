part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginValidation extends LoginState {
  LoginValidation();
}

class LoginSuccess extends LoginState {
  LoginSuccess();
}
