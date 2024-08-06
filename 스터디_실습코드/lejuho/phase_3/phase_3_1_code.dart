import 'screen/home_screen_1.dart';
import 'package:flutter/material.dart';

void main() {
  // 플러터 프레임워크가 앱을 실행할 준비가 될때까지
  // 기다림
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(), // 만든 위젯
    ),
  );
}
