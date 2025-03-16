import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/config/components/log.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget with LoggerMixin {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final TextEditingController passowrdController;
  const LoginButton({
    super.key,
    required this.formkey,
    required this.emailController,
    required this.passowrdController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginApiStatus == LoginApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('submitting...')));
        }
        if (state.loginApiStatus == LoginApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Success')));
        }
        if (state.loginApiStatus == LoginApiStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message.toString())));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginApi());
                context.read<LoginBloc>().add(
                  ClearController(
                    emailController: emailController,
                    passowrdController: passowrdController,
                  ),
                );
                logMessage('Login.....');
              } else {
                return;
              }
            },
            child: const Text('Login'),
          );
        },
      ),
    );
  }
}
