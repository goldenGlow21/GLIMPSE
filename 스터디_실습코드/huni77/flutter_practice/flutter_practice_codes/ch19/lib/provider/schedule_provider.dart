import 'package:calendar_scheduler/model/schedule_model.dart';
import 'package:calendar_scheduler/repository/schedule_repository.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ScheduleProvider extends ChangeNotifier {
  final ScheduleRepository repository; // API 요청 로직을 담은 클래스

  DateTime selectedDate = DateTime.utc(
    // 선택한 날짜
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  Map<DateTime, List<ScheduleModel>> cache = {}; // 일정 정보를 저장해둘 캐시

  ScheduleProvider({
    required this.repository,
  }) : super() {
    getSchedules(date: selectedDate);
  }

  void getSchedules({required DateTime date}) async {
    final resp = await repository.getSchedules(date: date); // GET 메서드 보내기

    cache.update(date, (value) => resp,
        ifAbsent: () => resp); // 선택한 날짜의 일정들 업데이트하기

    notifyListeners(); // 리슨하는 위젯들 업데이트 하기
  }

  void createSchedule({
    required ScheduleModel schedule,
  }) async {
    final targetDate = schedule.date;

    final savedSchedule = await repository.createSchedule(schedule: schedule);
    final uuid = Uuid();

    final tempId = uuid.v4(); // 유일한 ID 값을 생성합니다.
    final newSchedule = schedule.copyWith(
      id: tempId, // 임시 ID를 지정한다.
    );

    // 긍정적 응답 구간. 서버에서 응답을 받기 전에 캐시를 먼저 업데이트함
    cache.update(
      targetDate,
      (value) => [
        // 현존하는 캐시 리스트 끝에 새로운 일정 추가
        ...value,
        newSchedule,
      ]..sort(
          (a, b) => a.startTime.compareTo(
            b.startTime,
          ),
        ),
      ifAbsent: () => [newSchedule],
    );
    notifyListeners(); // 캐시 업데이트 반영
    try {
      // API 요청
      final savedSchedule = await repository.createSchedule(schedule: schedule);

      cache.update(
        // 서버 응답 기반으로 캐시 업데이트
        targetDate,
        (value) => value
            .map((e) => e.id == tempId
                ? e.copyWith(
                    id: savedSchedule,
                  )
                : e)
            .toList(),
      );
    } catch (e) {
      cache.update(
        // 삭제 실패 시 캐시 롤백하기
        targetDate,
        (value) => value.where((e) => e.id != tempId).toList(),
      );
    }
    notifyListeners();
  }

  void deleteSchedule({
    required DateTime date,
    required String id,
  }) async {
    final targetSchedule = cache[date]!.firstWhere(
      (e) => e.id == id,
    ); // 삭제할 일정 기억

    cache.update(
      // 캐시에서 데이터 삭제
      date,
      (value) => value.where((e) => e.id != id).toList(),
      ifAbsent: () => [],
    ); // 긍정적 응답 (응답하기 전에 캐시 먼저 업데이트)
    notifyListeners(); // 캐시 업데이트 반영

    try {
      await repository.deleteSchedule(id: id); // 삭제 함수 실행
    } catch (e) { // 삭제 실패 시 캐시 롤백하기
      cache.update(
        date,
        (value) => [...value, targetSchedule]..sort(
            (a, b) => a.startTime.compareTo(
              b.startTime,
            ),
          ),
      );
    }
    notifyListeners();
  }

  void changeSelectedDate({
    required DateTime date,
  }) {
    selectedDate = date; // 현재 선택된 날짜를 매개변수로 입력받은 날짜로 변경
    notifyListeners();
  }
}
