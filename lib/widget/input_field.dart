import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  //const InputField({Key? key}) : super(key: key);

  final IconData icon;
  final String hint;
  final bool obscure;

  InputField({required this.icon, required this.hint, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white,),
        contentPadding: EdgeInsets.only(
          left: 5,
          right: 30,
          bottom: 30,
          top: 30
        )
      ),
      style: TextStyle(color: Colors.white),
      obscureText: obscure,
    );
  }
}
