import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    // 선택된 날짜를 관리할 변수
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
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
              onDaySelected: onDaySelected, // 날짜가 선택됬을 떄 실행할 함수
            ),
            SizedBox(
              height: 8.0,
            ),
            StreamBuilder<List<Schedule>>( // 일정 Stream 으로 받아오기
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                return TodayBanner(
                  selectedDate: selectedDate,
                  count: snapshot.data?.length ?? 0, // 일정 개수 입력해주기
                );
              },
            ),
            // 오늘 날짜와 할일 개수 보여주는 위젯
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              // 남는 공간 모두 차지
              child: StreamBuilder<List<Schedule>>(
                // 일정 정보가 Stream 으로 제공되기 때문에 StreamBuilder 사용
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    // 데이터가 없을 때
                    return Container(); // 빈 컨테이너 리턴
                  }
                  return ListView.builder(
                    // 화면에 보이는 값들만 렌더링하는 리스트
                    itemCount: snapshot.data!.length, // 리스트에 입력할 값들의 총 개수
                    itemBuilder: (context, index) {
                      // 현재 index 에 해당되는 일정
                      final schedule = snapshot.data![index];
                      return Dismissible(
                        key: ObjectKey(schedule.id), // 생성한 스케줄의 고유한 키 값
                        direction: DismissDirection.startToEnd, // 밀기 방향 (왼->오)
                        onDismissed: (DismissDirection direction) {
                          // 밀기 했을 때 실행할 함수
                          GetIt.I<LocalDatabase>().removeSchedule(
                              schedule.id); // 스케줄id 로 해당되는 스케줄 삭제
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

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    // 날짜 선택될 때 마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
