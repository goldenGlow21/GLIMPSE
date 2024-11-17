import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';

import 'package:calendar_scheduler/provider/schedule_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<ScheduleProvider>(); // Provider 변경이 있을 때마다 build() 함수 재실행
    final selectedDate = provider.selectedDate; // 선택된 날짜 가져오기

    final schedules =
        provider.cache[selectedDate] ?? []; // 선택된 날짜에 해당되는 일정들 가져오기

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // 새 일정 버튼
        backgroundColor: PRIMARY_COLOR,

        // 추가 버튼 눌렀을 때 동작할 콜백
        onPressed: () {
          showModalBottomSheet(
            // BottomSheet 열기
            context: context,
            isDismissible: true, // 배경 탭했을 때 BottomSheet 닫기
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate, // 선택된 날짜 selectedDate 넘겨주기
            ),
            isScrollControlled: true, // 할 일 입력창 렌더링
          );
        },
        child: Icon(
          // '+' 모양 아이콘
          Icons.add,
        ),
      ),
      body: SafeArea(
        // 시스템 UI 피해서 UI 구현
        child: Column(
          // 달력과 리스트를 세로로 배치
          children: [
            // 달력 위젯
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달하기
              onDaySelected: (selectedDate, focusedDate) => onDaySelected(
                  selectedDate, focusedDate, context), // 날짜가 선택됐을 떄 실행할 함수
            ),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(
              selectedDate: selectedDate,
              count: schedules.length,
            ),
            // 오늘 날짜와 할일 개수 보여주는 위젯
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              // 남는 공간 모두 차지
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final schedule = schedules[index];

                  return Dismissible(
                    key: ObjectKey(schedule.id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (DismissDirection direction) {
                      provider.deleteSchedule(
                          date: selectedDate, id: schedule.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0),
                      child: ScheduleCard(
                        startTime: schedule.startTime,
                        endTime: schedule.endTime,
                        content: schedule.content,
                      ),
                    ),
                  );
                },
              ),
            ),
            // 할일 위젯
          ],
        ),
      ),
    );
  }

  void onDaySelected(
      DateTime selectedDate, DateTime focusedDate, BuildContext context) {
    // 날짜 선택될 때 마다 실행할 함수
    final provider = context.read<ScheduleProvider>();
    provider.changeSelectedDate(
      date: selectedDate,
    );
    provider.getSchedules(date: selectedDate);
  }
}
