import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Login Screen'), centerTitle: true),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInputWidget(emailController: _emailController),
                const SizedBox(height: 20),
                PasswordInputWidget(passowrdController: _passwordController),
                const SizedBox(height: 20),

                LoginButton(
                  formkey: _formkey,
                  emailController: _emailController,
                  passowrdController: _passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
