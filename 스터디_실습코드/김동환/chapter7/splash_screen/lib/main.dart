import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen()); // 1. SplashScreen 위젯을 첫 화면으로 지정
}

class SplashScreen extends StatelessWidget {  // 2. StatelessWidget 선언
  @override
  Widget build(BuildContext context) {  // 3. 위젯의 UI 구현
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          color: Color(0xFFF99231),
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 200,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}