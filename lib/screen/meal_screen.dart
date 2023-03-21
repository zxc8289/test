import 'package:balanstate_test02/componnent/calendar.dart';
import 'package:balanstate_test02/componnent/custom_text.dart';
import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // formKey
  final GlobalKey<FormState> formKey = GlobalKey();
  bool buttonClick = true;
  bool fold = true;

  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white, // set background color
        title: Text(
          'Meal',
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
          setState(() {
            fold = true;
          });
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
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // TextField (name, date)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _Header(
                              dayButtonClick: dayButtonClick,
                              monthButtonClick: monthButtonClick,
                              buttonClick: buttonClick,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            // Find ID, Find Password text fields

                            if (!buttonClick) ...[
                              _Month(),
                            ] else ...[
                              _Day(
                                fold: fold,
                                focusedDay: focusedDay,
                                selectedDay: selectedDay,
                                onDaySelected: onDaySelected,
                                onFoldButton: onFoldButton,
                                onAddButton: onAddButton,
                                onSubtractButton: onSubtractButton,
                              ),
                            ],
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
                            onPressed: () {},
                            child: Text(
                              'Meal Analysis',
                              style: TextStyle(fontSize: 19, color: Colors.white),
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

  dayButtonClick() {
    setState(() {
      buttonClick = true;
    });
  }

  monthButtonClick() {
    setState(() {
      buttonClick = false;
    });
  }

  onFoldButton() {
    setState(() {
      fold = !fold;
    });
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // 선택한 날짜로 변경
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

  onSubtractButton() {
    setState(() {
      selectedDay = selectedDay.subtract(const Duration(days: 1));
    });
  }

  onAddButton() {
    setState(() {
      selectedDay = selectedDay.add(const Duration(days: 1));
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback dayButtonClick;
  final VoidCallback monthButtonClick;
  final bool buttonClick;

  const _Header(
      {required this.buttonClick,
      required this.dayButtonClick,
      required this.monthButtonClick,
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
              onPressed: dayButtonClick,
              child: Text(
                'Day',
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
              onPressed: monthButtonClick,
              child: Text(
                'Month',
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

class _Day extends StatelessWidget {
  final bool fold;
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final VoidCallback onFoldButton;
  final VoidCallback onSubtractButton;
  final VoidCallback onAddButton;

  const _Day(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      required this.fold,
      required this.onFoldButton,
      required this.onSubtractButton,
      required this.onAddButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: fold ? 65.0 : 400.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              fold
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: onSubtractButton,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 190,
                          child: OutlinedButton(
                            onPressed: onFoldButton,
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              side: BorderSide(
                                color: Colors.green,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              '${DateFormat('yyyy / MM / dd').format(selectedDay!)}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onAddButton,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: 45,
                      child: OutlinedButton(
                        onPressed: onFoldButton,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          side: BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          'close',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Calendar(
                    selectedDay: selectedDay,
                    focusedDay: focusedDay,
                    onDaySelected: onDaySelected,
                  ),
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 5,),
        CustomText(
          mealTime: 'Breakfast',
          date: selectedDay!,
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomText(
          mealTime: 'Lunch',
          date: selectedDay!,
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomText(
          mealTime: 'Dinner',
          date: selectedDay!,
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomText(
          mealTime: 'Snack',
          date: selectedDay!,
        ),
      ],
    );
  }
}

class _Month extends StatelessWidget {
  const _Month({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Month'),
    );
  }
}
