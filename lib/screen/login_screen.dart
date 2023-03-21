import 'package:balanstate_test02/componnent/custom_text_field.dart';
import 'package:balanstate_test02/const/const.dart';
import 'package:balanstate_test02/screen/balanstate_screen.dart';
import 'package:balanstate_test02/screen/find_screen.dart';
import 'package:balanstate_test02/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // formKey
  final GlobalKey<FormState> formKey = GlobalKey();

  bool staySignedIn = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String loginId = '';
  String loginPassword = '';

  bool _isValid() {
    return loginId.isNotEmpty && loginPassword.isNotEmpty;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode()); // 키보드 닫기
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFFFFFFF),
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48.0, vertical: 40.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 상단 이미지
                        _TopImage(),

                        // 중앙 TextFiled, Text, CheckBox, Button
                        _Content(
                          emailController: emailController,
                          passwordController: passwordController,
                          onEmailChanged: onEmailChanged,
                          onPasswordChanged: onPasswordChanged,
                          onStaySignedIn: onStaySignedIn,
                          staySignedIn: staySignedIn,
                          isValid: _isValid(),
                          loginId: loginId,
                          loginPassword: loginPassword,
                          loginIdOnSaved: (String? val){
                            loginId = val!;
                          },
                          loginPasswordOnSaved: (String? val){
                            loginPassword = val!;
                          },
                          formKey: formKey,
                        ),

                        // 하단 이미지
                        _BottomImage(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onEmailChanged(value) {
    setState(() {
      loginId = value;
    });
  }

  onPasswordChanged(value) {
    setState(() {
      loginPassword = value;
    });
  }

  onStaySignedIn(value) {
    setState(() {
      staySignedIn = value!;
    });
  }
}

class _TopImage extends StatelessWidget {
  const _TopImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'asset/img/BalanState_Logo.png',
          height: 107,
        ),
        SizedBox(
          height: 44,
        ),
      ],
    );
  }
}

class _BottomImage extends StatelessWidget {
  const _BottomImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 49,
        ),
        Image.asset(
          'asset/img/hnb_logo.png',
          height: 45,
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<bool?>? onStaySignedIn;
  final bool staySignedIn;
  final bool isValid;
  final FormFieldSetter<String> loginIdOnSaved;
  final FormFieldSetter<String> loginPasswordOnSaved;
  final String loginId;
  final String loginPassword;
  final GlobalKey<FormState> formKey;

  const _Content({
    Key? key,
    required this.formKey,
    required this.loginId,
    required this.loginPassword,
    required this.loginIdOnSaved,
    required this.loginPasswordOnSaved,
    required this.isValid,
    required this.emailController,
    required this.passwordController,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onStaySignedIn,
    required this.staySignedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'E-mail',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            CustomTextField(
              password: '',
              textEditingController: emailController,
              onChanged: onEmailChanged,
              hintText: 'Please type your emial',
              tf: false,
              textFieldName: 'id',
              onSaved: loginIdOnSaved,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        Text(
          'Password',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            CustomTextField(
              password: '',
              textEditingController: passwordController,
              onChanged: onPasswordChanged,
              hintText: 'Please type your password',
              tf: true,
              textFieldName: 'password',
              onSaved: loginPasswordOnSaved,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                activeColor: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: staySignedIn,
                onChanged: onStaySignedIn,
                side: BorderSide(
                  width: 1,
                  color: Color(0xFFC2C2C2),
                ),
              ),
            ),
            Text(
              'Stay Signed in',
              style: TextStyle(color: TEXT_COLOR, fontSize: 16),
            ),
          ],
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: isValid ? () {
              if (formKey.currentState == null) {
                print('에러');
                return;
              }
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                print('로그인 페이지입니다.');
                print(loginId);
                print(loginPassword);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BalanStateHomeScreen();
                    },
                  ),
                );
              }
            } : null,
            child: Text(
              'Sign in',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: isValid ? PRIMARY_COLOR : Color(0xFFA5BCC9),
              disabledBackgroundColor: Color(0xFFA5BCC9),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return FindScreen();
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: TEXT_COLOR,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 4, // Space between underline and text
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC2C2C2),
                      width: 1.0, // Underline thickness
                    ),
                  ),
                ),
                child: Text(
                  'Find ID/PW',
                  style: TextStyle(fontSize: 16, color: Color(0xFFC2C2C2)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: TEXT_COLOR,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 4, // Space between underline and text
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC2C2C2),
                      width: 1.0, // Underline thickness
                    ),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, color: Color(0xFFC2C2C2)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
