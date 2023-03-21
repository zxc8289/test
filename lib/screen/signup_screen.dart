import 'package:balanstate_test02/componnent/custom_text_field.dart';
import 'package:balanstate_test02/componnent/tailtotail_checkbox.dart';
import 'package:balanstate_test02/const/const.dart';
import 'package:balanstate_test02/screen/login_screen.dart';
import 'package:flutter/material.dart';

enum gender { Male, Female }

enum yesorno { Yes, No }

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  yesorno? yes;
  yesorno? yesornoGroupValue1;
  yesorno? yesornoGroupValue2;
  yesorno? yesornoGroupValue3;
  yesorno? yesornoGroupValue4;
  yesorno? yesornoGroupValue5;
  yesorno? yesornoGroupValue6;
  yesorno? yesornoGroupValue7;

  // formKey
  final GlobalKey<FormState> formKey = GlobalKey();

  // 회원가입 정보
  String signUpId = '';
  String signUpPassword = '';
  String signUpComfirmPassword = '';
  String signUpName = '';
  String signUpDate = '';
  String signUpPhoneNumber = '';
  String signUpHeight = '';
  String signUpWeight = '';
  String signUpJob = '';

  // Gender 추가
  gender? genderSelected;

  final TextEditingController signUpIdTextEditingController =
      TextEditingController();
  final TextEditingController signUpPasswordTextEditingController =
      TextEditingController();
  final TextEditingController signUpComfirmPasswordTextEditingController =
      TextEditingController();
  final TextEditingController signUpNameTextEditingController =
      TextEditingController();
  final TextEditingController signUpDateTextEditingController =
      TextEditingController();
  final TextEditingController signUpHeightTextEditingController =
      TextEditingController();
  final TextEditingController signUpWeightTextEditingController =
      TextEditingController();
  final TextEditingController signUpJobTextEditingController =
      TextEditingController();
  final TextEditingController signUpPhoneNumberTextEditingController =
      TextEditingController();

  bool allCheck = false;
  bool termsOfService = false;
  bool privacyPolicy = false;
  bool signUpNextCheck = false;
  int signUpPage = 1;

  bool signUp() {
    return termsOfService == true && privacyPolicy == true;
  }

  bool signUp2() {
    return signUpId.isNotEmpty &&
        signUpPassword.isNotEmpty &&
        signUpComfirmPassword.isNotEmpty &&
        signUpName.isNotEmpty &&
        signUpDate.isNotEmpty &&
        genderSelected != null;
  }

  bool signUp3() {
    return yesornoGroupValue1 != null &&
        yesornoGroupValue2 != null &&
        yesornoGroupValue3 != null &&
        yesornoGroupValue4 != null &&
        yesornoGroupValue5 != null &&
        yesornoGroupValue6 != null &&
        yesornoGroupValue7 != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signUpPage == 1
          ? signUpAppBar1()
          : signUpPage == 2
              ? signUpAppBar2()
              : signUpAppBar3(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: double.infinity,
          color: Color(0xFFFFFFFF),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            signUpPage == 1
                                ?
                                // 가입 첫 페이지
                                _SignUp1(
                                    allCheck: allCheck,
                                    privacyPolicy: privacyPolicy,
                                    termsOfService: termsOfService,
                                    allCheckOnChanged: allCheckOnChanged,
                                    privacyPolicyOnChanged:
                                        privacyPolicyOnChanged,
                                    termsOfServiceOnChanged:
                                        termsOfServiceOnChanged,
                                  )
                                : signUpPage == 2
                                    ? _SignUp2(
                                        signUpPassword: signUpPassword,
                                        signUpIdTextEditingController:
                                            signUpIdTextEditingController,
                                        signUpDateTextEditingController:
                                            signUpDateTextEditingController,
                                        signUpNameTextEditingController:
                                            signUpNameTextEditingController,
                                        signUpComfirmPasswordTextEditingController:
                                            signUpComfirmPasswordTextEditingController,
                                        signUpPasswordTextEditingController:
                                            signUpPasswordTextEditingController,
                                        signUpHeightTextEditingController:
                                            signUpHeightTextEditingController,
                                        signUpWeightTextEditingController:
                                            signUpWeightTextEditingController,
                                        signUpJobTextEditingController:
                                            signUpJobTextEditingController,
                                        signUpPhoneNumberTextEditingContoller:
                                            signUpPhoneNumberTextEditingController,
                                        signUpIdOnChanged: signUpIdOnChanged,
                                        signUpPasswordOnChanged:
                                            signUpPasswordOnChanged,
                                        signUpComfirmPasswordOnChanged:
                                            signUpComfirmPasswordOnChanged,
                                        signUpNameOnChanged:
                                            signUpNameOnChanged,
                                        signUpDateOnChanged:
                                            signUpDateOnChanged,
                                        genderSelected: genderSelected,
                                        genderOnChanged: genderOnChanged,
                                        signUpHeightOnChanged:
                                            signUpHeightOnChanged,
                                        signUpWeightOnChanged:
                                            signUpWeightOnChanged,
                                        signUpJobOnChanged:
                                            signUpJobOnChanged,
                                        signUpPhoneNumberOnChanged:
                                            signUpPhoneNumberOmChanged,
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 20.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 10.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1.5,
                                                            color: Color(
                                                                0xFFDBDBDB))),
                                                  ),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 21.0,
                                                          color:
                                                              PRIMARY_COLOR,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Is',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF419D74), // set color of 'Is' to blue
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold, // add bold font weight to 'Is'
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                ' my health okay?',
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                Text(
                                                  'The following are questions about the constitution of health.',
                                                  style: TextStyle(
                                                    fontSize: 19.0,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 12.0,
                                                ),
                                                Text(
                                                  'Please respond with the closest answer.',
                                                  style: TextStyle(
                                                      fontSize: 17.0),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged1,
                                            yesornoGroupValue:
                                                yesornoGroupValue1,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '1. Eating cabbage makes your \n     stomach feel uncomfortable',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged2,
                                            yesornoGroupValue:
                                                yesornoGroupValue2,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '2. Eating meat causes digestive \n     problems.',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged3,
                                            yesornoGroupValue:
                                                yesornoGroupValue3,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '3. When you eat bread or noodles, \n     your stomach is uncomfortable.',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged4,
                                            yesornoGroupValue:
                                                yesornoGroupValue4,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '4. Eating spicy food makes your \n     stomach uncomfortable.',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged5,
                                            yesornoGroupValue:
                                                yesornoGroupValue5,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '5. Eating ice or cold food makes\n     you feel uncomfortable.',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged6,
                                            yesornoGroupValue:
                                                yesornoGroupValue6,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '6. Eating ginseng makes your body\n     feel uncomfortable.',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TailToTailCheckbox(
                                            yesornoOnChanged:
                                                yesornoOnChanged7,
                                            yesornoGroupValue:
                                                yesornoGroupValue7,
                                            yes: yesorno.Yes,
                                            no: yesorno.No,
                                            question:
                                                '7. When you eat tangerines or\n     oranges, your stomach is often\n     uncomfortable',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: signUpPage == 1
                                ? (signUp()
                                    ? () {
                                        setState(() {
                                          if(termsOfService != null && privacyPolicy != null) {
                                            signUpPage = signUpPage + 1;
                                          }
                                        });
                                      }
                                    : null)
                                : signUpPage == 2
                                    ? (signUp2()
                                        ? () {
                                            setState(() {
                                              if (formKey.currentState == null) {
                                                print('error');
                                                return;
                                              }
                                              if (formKey.currentState!.validate()) {
                                                formKey.currentState!.save();
                                                  signUpPage = signUpPage + 1;

                                              }
                                            });
                                          }
                                        : null)
                                    : signUpPage == 3
                                        ? (signUp3() ? () {
                                          print(signUpId);
                                          print(signUpPassword);
                                          print(signUpComfirmPassword);
                                          print(signUpName);
                                          print(signUpDate);
                                          print(signUpDate);
                                          print(signUpPhoneNumber);
                                          print(signUpHeight);
                                          print(signUpWeight);
                                          print(signUpJob);


                                          print(yesornoGroupValue1);
                                          print(yesornoGroupValue2);
                                          print(yesornoGroupValue3);
                                          print(yesornoGroupValue4);
                                          print(yesornoGroupValue5);
                                          print(yesornoGroupValue6);
                                          print(yesornoGroupValue7);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                            } : null)
                                        : null,
                            child: signUpPage == 1 || signUpPage == 2
                                ? Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  )
                                : Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF419D74),
                              disabledBackgroundColor: Color(0xFFBFD4CB),
                              // disabledBackgroundColor: Color(0xFFA5BCC9),
                            ),
                          ),
                        ),
                      ],
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

  AppBar signUpAppBar1() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, // set background color
      title: Text(
        'Sign Up',
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
    );
  }

  AppBar signUpAppBar2() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, // set background color
      title: Text(
        'Sign Up',
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
          setState(() {
            signUpPage = signUpPage - 1;
          });
        },
      ),
    );
  }

  AppBar signUpAppBar3() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, // set background color
      title: Text(
        'Tail to tail health check',
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
          setState(() {
            signUpPage = signUpPage - 1;
          });
        },
      ),
    );
  }

  allCheckOnChanged(value) {
    setState(
      () {
        allCheck = value!;
        termsOfService = value!;
        privacyPolicy = value!;
      },
    );
  }

  termsOfServiceOnChanged(value) {
    setState(
      () {
        termsOfService = value!;
      },
    );
  }

  privacyPolicyOnChanged(value) {
    setState(
      () {
        privacyPolicy = value!;
      },
    );
  }

  signUpIdOnChanged(value) {
    setState(() {
      signUpId = value;
    });
  }

  signUpPasswordOnChanged(value) {
    setState(() {
      signUpPassword = value;
    });
  }

  signUpComfirmPasswordOnChanged(value) {
    setState(() {
      signUpComfirmPassword = value;
    });
  }

  signUpNameOnChanged(value) {
    setState(() {
      signUpName = value;
    });
  }

  signUpDateOnChanged(value) {
    setState(() {
      signUpDate = value;
    });
  }

  signUpHeightOnChanged(value) {
    setState(() {
      signUpHeight = value;
    });
  }

  signUpWeightOnChanged(value) {
    setState(() {
      signUpWeight = value;
    });
  }

  signUpJobOnChanged(value) {
    setState(() {
      signUpJob = value;
    });
  }

  signUpPhoneNumberOmChanged(value) {
    setState(() {
      signUpPhoneNumber = value;
    });
  }

  genderOnChanged(value) {
    setState(() {
      genderSelected = value;
    });
  }

  yesornoOnChanged1(value) {
    setState(() {
      yesornoGroupValue1 = value;
    });
  }

  yesornoOnChanged2(value) {
    setState(() {
      yesornoGroupValue2 = value;
    });
  }

  yesornoOnChanged3(value) {
    setState(() {
      yesornoGroupValue3 = value;
    });
  }

  yesornoOnChanged4(value) {
    setState(() {
      yesornoGroupValue4 = value;
    });
  }

  yesornoOnChanged5(value) {
    setState(() {
      yesornoGroupValue5 = value;
    });
  }

  yesornoOnChanged6(value) {
    setState(() {
      yesornoGroupValue6 = value;
    });
  }

  yesornoOnChanged7(value) {
    setState(() {
      yesornoGroupValue7 = value;
    });
  }
}

class _SignUp1 extends StatelessWidget {
  final bool allCheck;
  final bool termsOfService;
  final bool privacyPolicy;
  final ValueChanged<bool?>? allCheckOnChanged;
  final ValueChanged<bool?>? termsOfServiceOnChanged;
  final ValueChanged<bool?>? privacyPolicyOnChanged;

  const _SignUp1(
      {required this.allCheckOnChanged,
      required this.termsOfServiceOnChanged,
      required this.privacyPolicyOnChanged,
      required this.allCheck,
      required this.privacyPolicy,
      required this.termsOfService,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.0,
                child: Checkbox(
                  activeColor: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: allCheck,
                  onChanged: allCheckOnChanged,
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
              Text(
                'I agree with all',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        ),
        ExpansionTile(
          title: Row(
            children: [
              Transform.scale(
                scale: 1.0,
                child: Checkbox(
                  activeColor: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: termsOfService,
                  onChanged: termsOfServiceOnChanged,
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
              Text(
                'Terms of Service',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 18.0),
              child: ListTile(
                title: SizedBox(
                  height: 275, // Set a specific height for the ListView
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFC2C2C2)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Text(
                          'Standard Terms and Conditions for E-commerce (Internet Cyber ​​Mall)\n\n'
                          'Article 1 (Purpose)\n'
                          'This agreement is a cyber mall in using Internet-related services (hereinafter referred to as "services") provided by OO cyber malls (hereinafter referred to as "mall") operated by OO companies (e-commerce business operators). It aims to stipulate the rights, duties and responsibilities of users and users.\n\n'
                          '※「This agreement applies mutatis mutandis to e-commerce transactions using PC communication, wireless, etc.」\n\n'
                          'Article 2 (Definition)\n'
                          '① “Mall” refers to a virtual business place set up to allow OO companies to trade goods or services using information and communication facilities such as computers in order to provide goods or services (hereinafter referred to as “goods, etc.”) to users, and It is also used in the sense of a business operator operating a cyber mall.\n\n'
                          '② “User” refers to members and non-members who access the “mall” and receive the services provided by the “mall” in in accordance with these terms and conditions.\n\n'
                          '③ “Member” refers to a person who has registered as a member in the “Mall” and can continue to use the services provided by the “Mall”.\n\n'
                          '④'
                          'Non -member'
                          ' refers to a person who uses the services provided by the “mall” without registering as a member.',
                          style: TextStyle(
                            fontSize: 17.0,
                            height: 1.5,
                            color: Color(0xFF6E6E6E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Row(
            children: [
              Transform.scale(
                scale: 1.0,
                child: Checkbox(
                  activeColor: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: privacyPolicy,
                  onChanged: privacyPolicyOnChanged,
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 18.0),
              child: ListTile(
                title: SizedBox(
                  height: 275, // Set a specific height for the ListView
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFC2C2C2)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Text(
                          'Chapter 1: General Provisions\n\nArticle 1 [Purpose]\n\nThese terms and conditions apply to the use of Internet_related services(here in after referred to as "services") provided by HnB Genomics cybermall(hereinafter referred to as " mall")',
                          style: TextStyle(
                              height: 1.6,
                              fontSize: 17.0,
                              color: Color(0xFF6E6E6E)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SignUp2 extends StatelessWidget {
  final TextEditingController signUpIdTextEditingController;
  final TextEditingController signUpPasswordTextEditingController;
  final TextEditingController signUpComfirmPasswordTextEditingController;
  final TextEditingController signUpNameTextEditingController;
  final TextEditingController signUpDateTextEditingController;
  final TextEditingController signUpHeightTextEditingController;
  final TextEditingController signUpWeightTextEditingController;
  final TextEditingController signUpJobTextEditingController;
  final TextEditingController signUpPhoneNumberTextEditingContoller;

  final ValueChanged<String> signUpIdOnChanged;
  final ValueChanged<String> signUpPasswordOnChanged;
  final ValueChanged<String> signUpComfirmPasswordOnChanged;
  final ValueChanged<String> signUpNameOnChanged;
  final ValueChanged<String> signUpDateOnChanged;
  final ValueChanged<String> signUpHeightOnChanged;
  final ValueChanged<String> signUpWeightOnChanged;
  final ValueChanged<String> signUpJobOnChanged;
  final ValueChanged<String> signUpPhoneNumberOnChanged;

  final gender? genderSelected;
  final ValueChanged<gender?>? genderOnChanged;


  final String signUpPassword;
  const _SignUp2(
      {required this.signUpPassword,
        required this.signUpIdTextEditingController,
      required this.signUpDateTextEditingController,
      required this.signUpNameTextEditingController,
      required this.signUpComfirmPasswordTextEditingController,
      required this.signUpPasswordTextEditingController,
      required this.signUpHeightTextEditingController,
      required this.signUpWeightTextEditingController,
      required this.signUpJobTextEditingController,
      required this.signUpPhoneNumberTextEditingContoller,
      required this.signUpIdOnChanged,
      required this.signUpPasswordOnChanged,
      required this.signUpComfirmPasswordOnChanged,
      required this.signUpNameOnChanged,
      required this.signUpDateOnChanged,
      required this.genderSelected,
      required this.genderOnChanged,
      required this.signUpHeightOnChanged,
      required this.signUpWeightOnChanged,
      required this.signUpJobOnChanged,
      required this.signUpPhoneNumberOnChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ID/Email
        Text(
          'ID/Email',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpIdTextEditingController,
          onChanged: signUpIdOnChanged,
          hintText: 'Please type your ID/Email',
          tf: false,
          textFieldName: 'id',
          onSaved: (String? val) {},
        ),

        SizedBox(
          height: 20,
        ),

        // Password
        Text(
          'Password',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: signUpPassword,
          textEditingController: signUpPasswordTextEditingController,
          onChanged: signUpPasswordOnChanged,
          hintText: 'Please type your Password',
          tf: true,
          textFieldName: 'password',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 17,
                  color: TEXT_COLOR,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Text(
              ' Only 6-16 Characters of alpanumeric charaters /\n special characters are allowed.',
              style: TextStyle(fontSize: 14, color: TEXT_COLOR),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        // Password 확인
        Text(
          'Comfirm Password',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(password: signUpPassword,
          textEditingController: signUpComfirmPasswordTextEditingController,
          onChanged: signUpComfirmPasswordOnChanged,
          hintText: 'Please type your Password again',
          tf: true,
          textFieldName: 'comfirmpassword',
          onSaved: (String? val) {},
        ),

        SizedBox(
          height: 20,
        ),

        // Name
        Text(
          'Name',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpNameTextEditingController,
          onChanged: signUpNameOnChanged,
          hintText: 'Please type your Name',
          tf: false,
          textFieldName: 'id',
          onSaved: (String? val) {},
        ),

        SizedBox(
          height: 20,
        ),

        // Date
        Text(
          'Date of Birth',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpDateTextEditingController,
          onChanged: signUpDateOnChanged,
          hintText: 'Please type your Date',
          tf: false,
          textFieldName: 'id',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Gender',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: Transform.scale(
                scale: 1.1,
                child: RadioListTile<gender>(
                  title: const Text('Male'),
                  value: gender.Male,
                  groupValue: genderSelected,
                  onChanged: genderOnChanged,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.1,
              child: Container(
                width: 150,
                child: RadioListTile<gender>(
                  title: const Text('Female'),
                  value: gender.Female,
                  groupValue: genderSelected,
                  onChanged: genderOnChanged,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Mobile Phone Number',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpPhoneNumberTextEditingContoller,
          onChanged: signUpPhoneNumberOnChanged,
          hintText: 'Please type your Phone Number',
          tf: false,
          textFieldName: 'number',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Height',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpHeightTextEditingController,
          onChanged: signUpHeightOnChanged,
          hintText: 'Number Only',
          tf: false,
          textFieldName: 'number',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Weight',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpWeightTextEditingController,
          onChanged: signUpWeightOnChanged,
          hintText: 'Number Only',
          tf: false,
          textFieldName: 'number',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Job',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          password: '',
          textEditingController: signUpJobTextEditingController,
          onChanged: signUpJobOnChanged,
          hintText: 'Please type your Job',
          tf: false,
          textFieldName: 'id',
          onSaved: (String? val) {},
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
