import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) {
      emit(event.username == "user" && event.password == "user123"
          ? LoginSuccess()
          : LoginValidation());
    });
  }
}
