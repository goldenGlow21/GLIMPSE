import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';

// material.dart 패키지의 Column 클래스와 중복되니 드리프트에서는 숨기기
import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:calendar_scheduler/database/drift_database.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate; // 선택된 날짜 상위위젯에서 입력받기
  const ScheduleBottomSheet({
    required this.selectedDate,
    Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey(); // 폼 key 생성

  int? startTime; // 시작 시간 저장 변수
  int? endTime; // 종료 시간 저장 변수
  String? content; // 일정 내용 저장 변수

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(  // 1. 텍스트 필드를 한 번에 관리할 수 있는 폼
      key: formKey, // 2. Form 을 조작할 키 값
      child:  SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 +
              bottomInset, // 2. 화면 반 높이에 키보드 높이 추가하기
          color: Colors.white,
          child: Padding(
            padding:
            EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: Column(
              // 2. 시간 관련 텍스트 필드와 내용관련 텍스트 필드 세로로 배치
              children: [
                Row(
                  // 1. 시작 시간 종료 시간 가로로 배치
                  children: [
                    Expanded(
                      child: CustomTextField(
                        // 시작시간 입력 필드
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          // 저장이 실행되면 startTime 변수에 텍스트 필드값 지정
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextField(
                        // 종료시간 입력 필드
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          // 저장이 실행되면 endTime 변수에 텍스트 필드값 지정
                          endTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: CustomTextField(
                    // 내용 입력 필드
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      // 저장이 실행되면 content 변수에 텍스트 필드값 지정
                      content = val;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // [저장] 버튼
                    // 3. [저장] 버튼
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  void onSavePressed() async {
    if(formKey.currentState!.validate()) { // 1. 폼 검증하기
      formKey.currentState!.save(); // 2. 폼 저장하기

      await GetIt.I<LocalDatabase>().createSchedule(  // 1. 일정 생성하기
        SchedulesCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDate),
        ),
      );

      Navigator.of(context).pop(); // 2. 일정생성 후 화면 뒤로 가기
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요';
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    return null;
  } // 1. 시간 검증 함수
  String? contentValidator(String? val) {
    if (val == null || val.length == 0) {
      return '값을 입력해주세요';
    }

    return null;
  } // 2. 내용 검증 함수
}