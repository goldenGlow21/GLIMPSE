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
            child: Stack(
              children: [
                // 빨간색 Container
                Container(
                  height: 300.0,
                  width: 300.0,
                  color: Colors.red,
                ),

                // 노란색 Container
                Container(
                  height: 250.0,
                  width: 250.0,
                  color: Colors.yellow,
                ),

                // 파란색 Container
                Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.blue,
                ),
              ],
            ),
          )),
    );
  }
}