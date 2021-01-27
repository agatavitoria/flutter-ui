import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  final IconData iconData;
  final Function(String) validator;
  final String initialValue, hintText, labelText;
  final bool obscureText;

  LoginTextFormField({
    @required this.iconData,
    @required this.validator,
    this.initialValue = '',
    this.hintText = '',
    this.labelText = '',
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.labelText,
        prefixIcon: Container(
          width: 70,
          child: Icon(
            this.iconData,
            color: Colors.black54,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: this.validator,
    );
  }
}
