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
            child: SafeArea(
              // 원하는 부위만 따로 적용할 수도 있습니다.
              // true는 적용 false는 미적용
              top: true,
              bottom: true,
              left: true,
              right: true,
              child: Container(
                color: Colors.red,
                height: 300.0,
                width: 300.0,
              ),
            ),
          )),
    );
  }
}