import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/config/components/build_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final TextEditingController passowrdController;

  const PasswordInputWidget({super.key, required this.passowrdController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        return previous.hideAndShowPassword != current.hideAndShowPassword ||
            previous.password != current.password;
      },

      builder: (context, state) {
        return TextFormField(
          obscureText: state.hideAndShowPassword,
          keyboardType: TextInputType.number,
          controller: passowrdController,

          onChanged:
              (value) => context.read<LoginBloc>().add(
                PasswordChange(password: value),
              ),
          validator: (value) => value!.isEmpty ? 'Enter Password' : null,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                context.read<LoginBloc>().add(HideAndShowPassword());
              },
              icon: Icon(
                state.hideAndShowPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            hintText: 'Password',
            border: BuildBorder.border(color: Colors.grey),
            focusedBorder: BuildBorder.border(color: Colors.grey),
            errorBorder: BuildBorder.border(color: Colors.red),
            enabledBorder: BuildBorder.border(color: Colors.grey),
          ),
        );
      },
    );
  }
}
