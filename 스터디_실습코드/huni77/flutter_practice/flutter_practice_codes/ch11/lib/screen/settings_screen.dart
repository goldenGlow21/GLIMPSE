import 'package:random_dice/const/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onThresholdChange;

  const SettingsScreen(
      {super.key, required this.threshold, required this.onThresholdChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                '민감도',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: 0.1, // 1. 최솟값
          max: 10.0, // 2. 최댓값
          divisions: 101, // 3. 최솟값 ~ 최댓값 사이 구간의 개수
          value: threshold, // 4. 슬라이더 선택값
          onChanged: onThresholdChange, // 5. 값 변경 시 실행되는 함수
          label: threshold.toStringAsFixed(1), // 6. 표시하는 값
        ),
      ],
    );
  }
}
