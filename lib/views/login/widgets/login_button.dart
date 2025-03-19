import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/config/components/log.dart';
import 'package:bloc_clean_coding/config/routes/route_name.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:bloc_clean_coding/utils/utils.dart';
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
      listenWhen:
          (previous, current) =>
              previous.loginApiStatus != current.loginApiStatus,
      listener: (context, state) {
        if (state.loginApiStatus == LoginApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('submitting...')));
        }
        if (state.loginApiStatus == LoginApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.home,
            (route) => false,
          );
        }
        if (state.loginApiStatus == LoginApiStatus.failure) {
          Utils.showErrorMessage(context, state.message.toString());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen:
            (previous, current) =>
                previous.loginApiStatus != current.loginApiStatus,
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
            child:
                state.loginApiStatus == LoginApiStatus.loading
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
          );
        },
      ),
    );
  }
}
