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
              child: GestureDetector(
                // 한번 탭했을 때, 실행할 함수
                onTap: () => {print('한번 누름?')},
                // 두번 탭했을 때, 실행할 함수
                onDoubleTap: () => {print('두번 누름?')},
                // 길게 눌렀을 때,
                onLongPress: () => {print('길게 누름?')},
                // 제스처를 적용할 위젯
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  width: 100,
                  height: 100,
                ),
              ))),
    );
  }
}