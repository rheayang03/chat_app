import 'package:flutter/material.dart';
import 'package:chat_app/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hashAsterisk;

  const LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.hashAsterisk = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hashAsterisk,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Add your username',
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(),
      ),
    );
  }
}
