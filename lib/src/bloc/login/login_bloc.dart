import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/src/models/user.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    //Add
    on<LoginEventAdd>((event, emit) async {
      // execute the something
      await Future.delayed(const Duration(seconds: 1)); // ตัวอย่าง feed api
      emit(state.copyWith(count: state.count + 1));
    });

    //Remove
    on<LoginEventRemove>((event, emit) {
      // execute the something
      emit(state.copyWith(count: state.count - 1));
    });

    //Login
    on<LoginEventLogin>((event, emit) {
      // execute the something
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthen: true));
      } else {
        emit(state.copyWith(isAuthen: false));
      }
    });
  }
}
