import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/settings_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7; // 민감도의 기본값 설정
  int number = 1; // 1. 주사위 숫자 상태
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);

    shakeDetector = ShakeDetector.autoStart( // 1. 흔들기 감지 즉시 시작
      shakeSlopTimeMS: 100, // 2. 감지 주기
      shakeThresholdGravity: threshold, // 3. 감지 민감도
      onPhoneShake: onPhoneShake, // 4. 감지 후 실행할 함수 등록
    );
  }

  void onPhoneShake() { // 5. 감지 후 실행할 함수
    final rand = new Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    controller!.removeListener(tabListener);
    shakeDetector!.stopListening(); // 6. 흔들기 감지 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number), // number 상태 변수로 대체
      SettingsScreen(
          threshold: threshold, onThresholdChange: onThresholdChange),
    ];
  }

  void onThresholdChange(double val) {
    setState(() {
      threshold = val; // 변경된 val 값으로 threshold값 초기화
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edgesensor_high_outlined,
          ),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }
}
