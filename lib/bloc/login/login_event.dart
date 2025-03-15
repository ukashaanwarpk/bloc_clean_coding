part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChange extends LoginEvent {
  final String email;
  const EmailChange({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChange extends LoginEvent {
  final String password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}


class LoginApi extends LoginEvent{

}


class ClearController extends LoginEvent{
  final TextEditingController emailController;
  final TextEditingController passowrdController;

  const ClearController({required this.emailController,required this.passowrdController});

  @override
  List<Object?> get props => [emailController,passowrdController];
}

class HideAndShowPassword extends LoginEvent{
  
}