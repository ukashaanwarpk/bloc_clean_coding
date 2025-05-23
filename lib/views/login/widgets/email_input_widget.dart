import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/config/components/build_border.dart';
import 'package:bloc_clean_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode emailFocus ;
  final FocusNode passwordFocus ;

  const EmailInputWidget({
    super.key,
    required this.emailController,
    required this.emailFocus,
    required this.passwordFocus,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => p.email != c.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: emailFocus,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          onChanged:
              (value) =>
                  context.read<LoginBloc>().add(EmailChange(email: value)),
          validator: (value) {
            if (value!.isEmpty) {
              return 'enter email';
            }
            if (!Utils.emailValidator(value)) {
              return 'Enter valid email';
            } else {
              return null;
            }
          },
          onFieldSubmitted: (value) => Utils.changeFocus(context, emailFocus, passwordFocus),
          decoration: InputDecoration(
            hintText: 'Email',
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
