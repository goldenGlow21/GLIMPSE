import 'package:flutter/material.dart';

// 아이콘 모양과 눌렀을 때 실행할 함수를 가진 인스턴스 생성
class CustomIconButton extends StatelessWidget {
  final GestureTapCallback onPressed; // 1. 아이콘을 눌렀을 때 실행할 함수
  final IconData iconData; // 2. 아이콘 모양(상위 위젯에서 모양에 따라 인스턴스를 생성할 것)

  // 생성자
  const CustomIconButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton( // 아이콘을 버튼으로 만들어주는 IconButton 위젯
      onPressed: onPressed, // 아이콘을 눌렀을 때 실행할 함수
      iconSize: 30.0, // 아이콘 크기
      color: Colors.white, // 아이콘 색상
      icon: Icon( // 아이콘
        iconData, // 생성자로부터 아이콘 모양 전달받음
      ),
    );
  }
}
