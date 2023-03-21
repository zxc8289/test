import 'package:balanstate_test02/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class TailToTailCheckbox extends StatelessWidget {
  final String question;
  final yesorno yes;
  final yesorno no;
  final yesorno? yesornoGroupValue;
  final ValueChanged<yesorno?>? yesornoOnChanged;

  const TailToTailCheckbox(
      {required this.yesornoGroupValue,
      required this.yesornoOnChanged,
      required this.yes,
      required this.no,
      required this.question,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDBDBDB)),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Text(

              question,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Transform.scale(
              scale: 1.1,
              child: RadioListTile<yesorno>(
                title: const Text('Yes'),
                value: yes,
                groupValue: yesornoGroupValue,
                onChanged: yesornoOnChanged,
              ),
            ),
            Transform.scale(
              scale: 1.1,
              child: RadioListTile<yesorno>(
                title: const Text('No'),
                value: no,
                groupValue: yesornoGroupValue,
                onChanged: yesornoOnChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
