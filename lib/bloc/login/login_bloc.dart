import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/login_repository.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
   LoginRepository loginRepository ;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
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

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginApiStatus: LoginApiStatus.loading));

    Map<String, dynamic> data = {
      'email': state.email,
      'password': state.password,
    };

    await loginRepository
        .loginApi(data)
        .then((value) {
          if (value.error.isNotEmpty) {
            emit(
              state.copyWith(
                loginApiStatus: LoginApiStatus.failure,
                message: value.error,
              ),
            );
          } else {
            emit(
              state.copyWith(
                loginApiStatus: LoginApiStatus.success,
                message: value.token,
             
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              loginApiStatus: LoginApiStatus.failure,
              message: error.toString(),
            ),
          );
        });
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
