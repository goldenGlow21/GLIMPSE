import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState(); // 부모 initState() 실행

    Timer.periodic(
      // Timer.periodic() 등록
      Duration(seconds: 3),
          (timer) {
        print('실행');
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return;
        }
        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          // 페이지 변경
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: pageController,
        // PageView 추가
        children: [1, 2, 3, 4, 5] // 샘플 리스트 생성
            .map(
          // 위젯으로 매핑
              (number) => Image.asset(
            'asset/img/image_$number.jpeg',
            fit: BoxFit.cover,
          ),
        )
            .toList(),
      ),
    );
  }
}
