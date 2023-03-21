import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealCustomTextField extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final String? productIngredients;

  const MealCustomTextField({required this.productIngredients, required this.onSaved, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: TextEditingController(text: productIngredients),
      validator: (String? val) {
        if (val == null || val.isEmpty) {}

        return null;
      },
      keyboardType: null,
      style: TextStyle(
        fontSize: 18,
      ),
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFC2C2C2),
            width: 1.0,
          ),
        ),

        hintStyle: TextStyle(
          color: Color(0xFFC2C2C2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 17.0),
      ),
    );
  }
}