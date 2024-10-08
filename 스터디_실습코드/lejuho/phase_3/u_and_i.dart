import '../phase_3/screen/u_and_i_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: 'sunflower', // 기본 글씨체
          textTheme: TextTheme(
            headline1: TextStyle(
              //  headline1 스타일 정의
              color: Colors.white, //  글 색상
              fontSize: 80.0, //  글 크기
              fontWeight: FontWeight.w700, //  글 두께
              fontFamily: 'parisienne', //  글씨체
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )),
      home: HomeScreen(),
    ),
  );
}
