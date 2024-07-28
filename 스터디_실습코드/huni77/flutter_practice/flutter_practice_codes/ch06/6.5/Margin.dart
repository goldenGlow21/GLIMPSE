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
                  color: Colors.blue,
                  child: // ③ 최상위 검정 컨테이너 (margin이 적용되는 대상)
                  Container(
                    color: Colors.black,

                    // ② 중간 파란 컨테이너
                    child: Container(
                      color: Colors.blue,

                      // 마진 적용 위치
                      margin: EdgeInsets.all(16.0),

                      // 패딩 적용
                      child: Padding(
                        padding: EdgeInsets.all(16.0),

                        // ① 패딩이 적용된 빨간 컨테이너
                        child: Container(
                          color: Colors.red,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  )))),
    );
  }
}