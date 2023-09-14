import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_valbury/util/constant/regex_pattern.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<EmailChanged>((event, emit) {
      emit(ValidationError(
          email: _isValidEmail(event.email) ? null : "Email not Valid",
          phone: state.errorPhone));
    });

    on<PhoneChanged>((event, emit) {
      emit(ValidationError(
          email: state.errorEmail,
          phone: _isValidPhone(event.phone) ? null : "Phone not Valid"));
    });

    on<SubmitButtonPressed>((event, emit) {
      if (state.errorEmail == null && state.errorPhone == null) {
        emit(const RegistrationSuccess());
        const Duration(seconds: 2);
        emit(const RegisterNavigateLogin());
      }
    });
  }
}

bool _isValidEmail(String email) {
  final bool result = RegExp(RegexPattern.email).hasMatch(email) || email == "";
  return result;
}

bool _isValidPhone(String phone) {
  return RegExp(RegexPattern.numberOnly).hasMatch(phone) && phone.length < 11;
}
