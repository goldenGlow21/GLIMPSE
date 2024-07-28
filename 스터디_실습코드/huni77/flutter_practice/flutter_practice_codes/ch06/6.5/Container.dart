import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 생성자
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: Container(
              // 스타일 작용
              decoration: BoxDecoration(
                // 배경색 적용
                color: Colors.red,
                // 테두리 적용
                border: Border.all(
                  // 테두리 굵기
                  width: 16.0,
                  // 테두리 색상
                  color: Colors.black,
                ),
                // 모서리 둥글게 만들기
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              // 높이
              height: 200.0,
              // 너비
              width: 100.0,
            ),
          )),
    );
  }
}