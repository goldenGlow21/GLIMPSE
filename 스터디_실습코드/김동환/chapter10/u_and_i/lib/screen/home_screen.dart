import 'package:flutter/material.dart';
// 1. 쿠퍼티노(iOS) 위젯 사용하기 위해 필요
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(

              onHeartPressed: onHeartPressed,
              firstDay: firstDay, // 6.
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              // 1. 날짜가 변겨오디면 실행되는 함수
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ), 
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // 1. 사귀기 시작한 날

  _DDay({
    required this.onHeartPressed,
    required this.firstDay, // 2. 날짜 변수로 입력받기
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 3. 현재 날짜 시간
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 글자
          'U&I',
          style: textTheme.headline1, // headline1 스타일 적용
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyText1, // bodyText1 스타일 적용
        ),
        Text( // 임시로 지정한 만난 날짜
          // 4. DateTime을 년.월.일 형태로 변경
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText2, // bodyText2 스타일 적용
        ),
        const SizedBox(height: 16.0),
        IconButton( // 하트 아이콘 버튼
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,  // 2. 색상 빨강으로 변경
          ),
        ),
        const SizedBox(height: 16.0),
        Text( // 만난 후 DDay
          'D+${DateTime(now.year, now.month,
          now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headline2,
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded( // Expanded 추가
        child: Center(
          child: Image.asset(
            'asset/img/middle_image.png',
            // Expanded가 우선순위를 갖게 되어 무시된다.
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
    );
  }
}