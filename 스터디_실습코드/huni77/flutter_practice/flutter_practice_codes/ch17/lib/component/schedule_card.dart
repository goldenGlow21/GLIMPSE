import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

// Schedule Card 위젯
class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;

  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight( // 1. 높이를 내부 위젯들의 최대 높이로 설정
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 일정 시작과 종료 시간을 알려줄 Time 위젯
              _Time(
                startTime: startTime,
                endTime: endTime,
              ),
              SizedBox(
                width: 16.0,
              ),
              // 일정 내용을 보여줄 Content 위젯
              _Content(
                content: content,
              ),
              SizedBox(
                width: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 시간 보여줄 Time 위젯
class _Time extends StatelessWidget {
  final int startTime; // 시작시간
  final int endTime; // 종료시간

  // 생성자
  const _Time({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 16.0,
    );

    return Column(
      // 시간 위에서 아래로 시작시간, 끝나는시간 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 각각 숫자가 두자리수가 안되면 0으로 채워주기
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          '${endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(fontSize: 10.0),
        ),
      ],
    );
  }
}

// 내용을 보여줄 Content 위젯
class _Content extends StatelessWidget {
  final String content;

  // 생성자
  const _Content({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        content,
      ),
    );
  }
}
