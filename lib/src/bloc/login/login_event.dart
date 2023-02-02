part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override // พิมพ์ prev
  List<Object?> get props => [];
}

//ประการ action
class LoginEventAdd extends LoginEvent {}

class LoginEventRemove extends LoginEvent {}

class LoginEventLogin extends LoginEvent {
  final User payload;
  LoginEventLogin(this.payload);
}
