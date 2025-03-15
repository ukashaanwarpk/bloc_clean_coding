part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;

  final bool hideAndShowPassword;

  const LoginState({
    this.email = '',
    this.password = '',
    this.hideAndShowPassword= true,
    
  });

  @override
  List<Object?> get props => [email, password, hideAndShowPassword];

  LoginState copyWith({
    String? email,
    String? password,
    bool? hideAndShowPassword
   
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      hideAndShowPassword: hideAndShowPassword ?? this.hideAndShowPassword,
    );
  }
}
