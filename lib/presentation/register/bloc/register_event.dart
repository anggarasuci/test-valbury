part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterEvent {
  final String phone;

  PhoneChanged({required this.phone});
}

class SubmitButtonPressed extends RegisterEvent {
  final String email;
  final String phone;

  SubmitButtonPressed({required this.email, required this.phone});
}
