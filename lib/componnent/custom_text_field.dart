import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool tf;
  final TextEditingController textEditingController;
  final String textFieldName;
  final FormFieldSetter<String> onSaved;
  final String password;

  const CustomTextField(
      {required this.onSaved,
        required this.password,
      required this.textFieldName,
      required this.textEditingController,
      required this.tf,
      required this.hintText,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          if (textFieldName == 'name') {
            return 'Input your name, please';
          }

          if (textFieldName == 'id') {
            return 'Please enter your ID';
          }

          if (textFieldName == 'date') {
            return 'Please enter a date';
          }
        }

        if (textFieldName == 'password') {
          if (val!.length > 16 || val.length < 6) {
            return 'The length of the password is less than 6 characters or more than 16 characters.';
          } else {}
        }

        if(textFieldName == 'comfirmpassword'){
          if(password != val){
            return 'Passwords do not match';
          }
        }

        return null;
      },
      controller: textEditingController,
      keyboardType: textFieldName == 'date'
          ? TextInputType.datetime
          : textFieldName == 'number'
              ? TextInputType.number
              : null,
      style: TextStyle(
        fontSize: 18,
      ),
      obscureText: tf ? true : false, // 비밀번호
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFC2C2C2),
            width: 1.0,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFFC2C2C2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 17.0),
      ),
      onChanged: onChanged,
    );
  }
}
