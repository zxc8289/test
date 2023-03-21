import 'package:balanstate_test02/componnent/custom_text_field.dart';
import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  // formKey
  final GlobalKey<FormState> formKey = GlobalKey();

  // Find ID
  String findIdName = '';
  String findIdDate = '';
  final TextEditingController findIdNameTextEditingController =
      TextEditingController();
  final TextEditingController findIdDateTextEditingController =
      TextEditingController();

  // Find Password
  String findPasswordID = '';
  String findPasswordName = '';
  String findPasswordDate = '';
  final TextEditingController findPasswordIdTextEditingController =
      TextEditingController();
  final TextEditingController findPasswordNameTextEditingController =
      TextEditingController();
  final TextEditingController findPasswordDateTextEditingController =
      TextEditingController();

  bool buttonClick = true;

  bool isValid() {
    return findIdName.isNotEmpty && findIdDate.isNotEmpty;
  }

  bool isValid2() {
    return findPasswordName.isNotEmpty &&
        findPasswordDate.isNotEmpty &&
        findPasswordID.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white, // set background color
        title: Text(
          'Find ID/PW',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
              color: Color(0xFF1A5071), size: 40), // set icon color and size
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFFFFFFF),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // TextField (name, date)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Find ID, Find Password 버튼
                            _Header(
                              findIdButtonClick: findIdButtonClick,
                              findPasswordButtonClick: findPasswordButtonClick,
                              buttonClick: buttonClick,
                            ),

                            // Find ID, Find Password 텍스트 필드
                            buttonClick
                                // Find ID 버튼이 클릭 됐을 때
                                ? _FindId(
                                    findIdDate: findIdDateOnChanged,
                                    findIdName: findIdNameOnChanged,
                                    findIdDateTextEditingController:
                                        findIdDateTextEditingController,
                                    findIdNameTextEditingController:
                                        findIdNameTextEditingController,
                                    findIdNameOnSaved: (String? val) {
                                      findIdName = val!;
                                    },
                                    findIdDateOnSaved: (String? val) {
                                      findIdDate = val!;
                                    },
                                  )
                                // Find Password 버튼이 클릭 됐을 때
                                : _FindPassword(
                                    findPasswordID: findPasswordIdOnChanged,
                                    findPasswordName: findPasswordNameOnChanged,
                                    findPasswordDate: findPasswordDateOnChanged,
                                    findPasswordIDTextEditingController:
                                        findPasswordIdTextEditingController,
                                    findPasswordNameTextEditingController:
                                        findPasswordNameTextEditingController,
                                    findPasswordDateTextEditingController:
                                        findPasswordDateTextEditingController,
                                    findPasswordIdOnSaved: (String? val) {
                                      findPasswordID = val!;
                                    },
                                    findPasswordNameOnSaved: (String? val) {
                                      findPasswordName = val!;
                                    },
                                    findPasswordDateOnSaved: (String? val) {
                                      findPasswordDate = val!;
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    // 하단 Find ID 버튼
                    _Footer(
                      formKey: formKey,
                      buttonClick: buttonClick,
                      isValid: isValid(),
                      isValid2: isValid2(),
                      findIdName: findIdName,
                      findIdDate: findIdDate,
                      findPasswordID: findPasswordID,
                      findPasswordName: findPasswordName,
                      findPasswordDate: findPasswordDate,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  findIdButtonClick() {
    setState(() {
      // findIdNameTextEditingController.text = '';
      // findIdDateTextEditingController.text = '';
      buttonClick = true;

    });

  }

  findPasswordButtonClick() {
    setState(() {
      // findPasswordIdTextEditingController.text = '';
      // findPasswordNameTextEditingController.text = '';
      // findPasswordDateTextEditingController.text = '';
      buttonClick = false;
    });
  }

  // _FindId
  findIdNameOnChanged(value) {
    setState(() {
      findIdName = value;
    });
  }

  findIdDateOnChanged(value) {
    setState(() {
      findIdDate = value;
    });
  }

  // _FindPassword
  findPasswordIdOnChanged(value) {
    setState(
      () {
        findPasswordID = value;
      },
    );
  }

  findPasswordNameOnChanged(value) {
    setState(
      () {
        findPasswordName = value;
      },
    );
  }

  findPasswordDateOnChanged(value) {
    setState(
      () {
        findPasswordDate = value;
      },
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback findIdButtonClick;
  final VoidCallback findPasswordButtonClick;
  final bool buttonClick;

  const _Header(
      {required this.buttonClick,
      required this.findIdButtonClick,
      required this.findPasswordButtonClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 55,
            child: ElevatedButton(
              onPressed: findIdButtonClick,
              child: Text(
                'Find ID',
                style: TextStyle(
                  fontSize: 19,
                  color: buttonClick ? Colors.white : PRIMARY_COLOR,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft:
                          Radius.circular(10)), // Fixed the argument error
                ),
                primary: buttonClick ? PRIMARY_COLOR : Colors.white,
                // disabledBackgroundColor: Color(0xFFA5BCC9),
                side: BorderSide(
                  color: PRIMARY_COLOR,
                  width: 1.7,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 55,
            child: ElevatedButton(
              onPressed: findPasswordButtonClick,
              child: Text(
                'Find Password',
                style: TextStyle(
                  fontSize: 19,
                  color: buttonClick ? PRIMARY_COLOR : Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight:
                          Radius.circular(10)), // Fixed the argument error
                ),
                primary: buttonClick ? Colors.white : PRIMARY_COLOR,
                // disabledBackgroundColor: Color(0xFFA5BCC9),
                side: BorderSide(
                  color: PRIMARY_COLOR,
                  width: 1.7,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FindId extends StatelessWidget {
  final ValueChanged<String> findIdName;
  final ValueChanged<String> findIdDate;
  final TextEditingController findIdNameTextEditingController;
  final TextEditingController findIdDateTextEditingController;
  final FormFieldSetter<String> findIdNameOnSaved;
  final FormFieldSetter<String> findIdDateOnSaved;

  const _FindId(
      {required this.findIdDateTextEditingController,
      required this.findIdNameTextEditingController,
      required this.findIdName,
      required this.findIdDate,
      required this.findIdNameOnSaved,
      required this.findIdDateOnSaved,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          'Name',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: findIdNameTextEditingController,
          onChanged: findIdName,
          hintText: 'Please type your name',
          tf: false,
          textFieldName: 'name',
          onSaved: findIdNameOnSaved,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Date of Birth',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: findIdDateTextEditingController,
          onChanged: findIdDate,
          hintText: 'Please type your date',
          tf: false,
          textFieldName: 'date',
          onSaved: findIdDateOnSaved,
        ),
      ],
    );
  }
}

class _FindPassword extends StatelessWidget {
  final ValueChanged<String> findPasswordID;
  final ValueChanged<String> findPasswordName;
  final ValueChanged<String> findPasswordDate;
  final TextEditingController findPasswordIDTextEditingController;
  final TextEditingController findPasswordNameTextEditingController;
  final TextEditingController findPasswordDateTextEditingController;
  final FormFieldSetter<String> findPasswordIdOnSaved;
  final FormFieldSetter<String> findPasswordNameOnSaved;
  final FormFieldSetter<String> findPasswordDateOnSaved;

  const _FindPassword(
      {required this.findPasswordID,
      required this.findPasswordName,
      required this.findPasswordDate,
      required this.findPasswordIDTextEditingController,
      required this.findPasswordNameTextEditingController,
      required this.findPasswordDateTextEditingController,
      required this.findPasswordIdOnSaved,
      required this.findPasswordNameOnSaved,
      required this.findPasswordDateOnSaved,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          'ID/Email',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: findPasswordIDTextEditingController,
          onChanged: findPasswordID,
          hintText: 'Please type your id/email',
          tf: false,
          textFieldName: 'id',
          onSaved: findPasswordIdOnSaved,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Name',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: findPasswordNameTextEditingController,
          onChanged: findPasswordName,
          hintText: 'Please type your name',
          tf: false,
          textFieldName: 'name',
          onSaved: findPasswordNameOnSaved,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Date of Birth',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: findPasswordDateTextEditingController,
          onChanged: findPasswordDate,
          hintText: 'Please type your date',
          tf: false,
          textFieldName: 'date',
          onSaved: findPasswordDateOnSaved,
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  final bool buttonClick;
  final bool isValid;
  final bool isValid2;
  final GlobalKey<FormState> formKey;
  final String findIdName;
  final String findIdDate;
  final String findPasswordID;
  final String findPasswordName;
  final String findPasswordDate;

  // final VoidCallback onPressed;

  const _Footer(
      {required this.formKey,
      required this.buttonClick,
      required this.isValid,
      required this.isValid2,
      required this.findIdName,
      required this.findIdDate,
      required this.findPasswordID,
      required this.findPasswordName,
      required this.findPasswordDate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: buttonClick
                ? (isValid
                    ? () {
                        if (formKey.currentState == null) {
                          print('에러');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print('아이디 찾기 페이지입니다.');
                          print(findIdName);
                          print(findIdDate);
                          Navigator.of(context).pop();
                        }
                      }
                    : null)
                : (isValid2
                    ? () {
                        if (formKey.currentState == null) {
                          print('에러');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print('비밀번호 찾기 페이지입니다.');
                          print(findPasswordID);
                          print(findPasswordName);
                          print(findPasswordDate);
                        }
                      }
                    : null),
            child: buttonClick
                ? Text(
                    'Find ID',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                : Text(
                    'Find Password',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
            style: ElevatedButton.styleFrom(
              primary: buttonClick
                  ? (isValid ? Color(0xFF419D74) : Color(0xFFBFD4CB))
                  : (isValid2 ? Color(0xFF419D74) : Color(0xFFBFD4CB)),
              disabledBackgroundColor: Color(0xFFBFD4CB),
              // disabledBackgroundColor: Color(0xFFA5BCC9),
            ),
          ),
        ),
      ],
    );
  }
}
