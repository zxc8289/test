import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';

class HealthState extends StatelessWidget {
  final String? name;
  final Icon iconName;
  final String state;
  const HealthState({required this.state, required this.iconName, required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Container(
        height: 112,
        padding: const EdgeInsets.only(left: 3.0, right: 3.0, top: 8.0, bottom: 4.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDBDBDB)),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            iconName,
            Expanded(
              child: Center(
                child: Text(
                  '$name',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              height: 25,
              decoration: BoxDecoration(
                color: state == 'Bad' ? Color(0xFFEF7523) : state == 'Normal' ? Color(0xFFF4AB0F) : Color(0xFF079A81),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "$state",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
