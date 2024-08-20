import 'package:flutter/material.dart';
import '../phase_3/screen/DD/digital_dice_screen.dart';
import '/planner-GLIMPSE/스터디_실습코드/lejuho/phase_3/const/colors.dart';
import '../phase_3/screen/DD/root_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          // Slider 위젯 관련
          thumbColor: primaryColor, // 동그라미 색
          activeTrackColor: primaryColor, // 이동한 트랙 색

          // 아직 이동하지 않은 트랙 색
          inactiveTrackColor: primaryColor.withOpacity(0.3),
        ),
        // BottomNavigationBar 위젯 관련
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor, // 선택 상태 색
          unselectedItemColor: secondaryColor, // 비선택 상태 색
          backgroundColor: backgroundColor, // 배경 색
        ),
      ),
      home: RootScreen(),
    ),
  );
}
