import 'package:flutter/material.dart';

// 스티커를 선택할 때 마다 실행할 함수
typedef OnEmotionTap = void Function(int id);

class Footer extends StatelessWidget {
  final OnEmotionTap onEmoticonTap;

  const Footer({
    super.key,
    required this.onEmoticonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      height: 150,
      child: SingleChildScrollView( // 가로로 스크롤 가능하게 스티커 구현
        scrollDirection: Axis.horizontal, // 가로로 스크롤
        child: Row(
          children: List.generate(
            7,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  onEmoticonTap(index + 1); // 스티커 선택할 때 실행할 함수
                },
                child: Image.asset(
                  'asset/img/emoticon_${index + 1}.png',
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
