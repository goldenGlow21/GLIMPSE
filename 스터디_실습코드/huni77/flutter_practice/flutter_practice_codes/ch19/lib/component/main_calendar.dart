import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected; // 1. 날짜 선택 시 실행할 함수
  final DateTime selectedDate; // 2. 선택된 날짜

  // 생성자
  const MainCalendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR', // 한국어로 언어 변경

      onDaySelected: onDaySelected,
      // 3. 날짜 선택 시 실행할 함수
      selectedDayPredicate: (date) => // 4. 선택된 날짜를 구분할 로직, 어떤 날짜를 선택된 날짜로 지정할지 결정
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      // 화면에 보여지는 날
      firstDay: DateTime(1800, 1, 1),
      // 달력 첫째 날
      lastDay: DateTime(3000, 1, 1),
      // 달력 마지막 날
      headerStyle: HeaderStyle(
        // 1. 달력 최상단 스타일
        titleCentered: true, // 제목 중앙 위치
        formatButtonVisible: false, // 달력 크기 선택 옵션 제거
        titleTextStyle: TextStyle(
          // 제목글꼴
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          // 2. 기본 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(
          // 3. 주말 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: DARK_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(
          // 4. 선택된 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(
          // 5. 기본 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          // 6. 주말 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(
          // 7. 선택된 날짜 글꼴
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
