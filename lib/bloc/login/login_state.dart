part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginApiStatus loginApiStatus;

  final bool hideAndShowPassword;

  const LoginState({
    this.email = '',
    this.password = '',
    this.hideAndShowPassword= true,
    this.loginApiStatus = LoginApiStatus.initial,
    this.message = '',
    
  });

  @override
  List<Object?> get props => [email, password, hideAndShowPassword, loginApiStatus, message];

  LoginState copyWith({
    String? email,
    String? password,
    bool? hideAndShowPassword,
    LoginApiStatus? loginApiStatus,
    String? message,
   
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      hideAndShowPassword: hideAndShowPassword ?? this.hideAndShowPassword,
      loginApiStatus: loginApiStatus ?? this.loginApiStatus,
      message: message ?? this.message,
    );
  }
}
