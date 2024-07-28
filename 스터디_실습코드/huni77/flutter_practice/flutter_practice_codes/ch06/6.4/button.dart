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
              child: TextButton(
                onPressed: () => {print('클릭함?')},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),

                //버튼에 넣을 텍스트 위젯
                child: Text(
                  '텍스트 버튼임',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ))),
    );
  }
}