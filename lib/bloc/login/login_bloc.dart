import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChange>(_emailChange);
    on<PasswordChange>(_passwordChange);
    on<LoginApi>(_loginApi);
    on<ClearController>(_clearController);
    on<HideAndShowPassword>(_hideAndShowPassword);
  }

  void _emailChange(EmailChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChange(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: '', password: ''));
  }

  void _clearController(ClearController event, Emitter<LoginState> emit) {
    event.emailController.clear();
    event.passowrdController.clear();
    emit(state.copyWith(email: '', password: ''));
  }

  void _hideAndShowPassword(
    HideAndShowPassword event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(hideAndShowPassword: !state.hideAndShowPassword));
  }
}
