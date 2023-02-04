import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/src/app.dart';
import 'package:first_app/src/models/user.dart';
import 'package:first_app/src/pages/routes.dart';
import 'package:flutter/material.dart';
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
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
              //ไม่มีปุ่ม back
              navigatorState.currentContext!,
              AppRoute.home);
        }
      } else {
        emit(state.copyWith(isAuthen: false));
      }
    });
  }
}
