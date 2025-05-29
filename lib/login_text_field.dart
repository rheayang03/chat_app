import 'chat_app/textfield_styles.dart';
import 'package:flutter/material.dart';

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hashAsterisk;

  const LoginTextField({Key? key, 
        required this.controller, 
        required this.hintText, 
         this.validator, this.hashAsterisk = false}) 
         : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hashAsterisk,
                    validator: (value) {
                      if (validator != null) {
                        return validator!(value);
                      }
                    
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