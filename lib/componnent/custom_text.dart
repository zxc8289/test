import 'package:balanstate_test02/screen/inputmeal_screen.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String mealTime;
  final DateTime date;

  const CustomText({required this.date, required this.mealTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.restaurant,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  '$mealTime',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return InputMealScreen(
                        date: date,
                        mealTime: mealTime,
                      );
                    },
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
