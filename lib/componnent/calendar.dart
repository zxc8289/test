import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  const Calendar({required this.onDaySelected, required this.selectedDay, required this.focusedDay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(1800),       // 1800년부터
      lastDay: DateTime(3000),        // 3000년까지
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration:defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: PRIMARY_COLOR,
              width: 1.0,
            ),
          ),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          defaultTextStyle:defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(
            color: PRIMARY_COLOR,
          )
      ),

      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date){      // 변경된 날짜로 다시 뿌려주기
        if(selectedDay == null){
          return false;
        }

        return date.year == selectedDay!.year
            && date.month == selectedDay!.month
            && date.day == selectedDay!.day; // 모든 조건이 충족되서 true로 리턴되면 선택된 값으로 바뀜
      },
    );
  }
}