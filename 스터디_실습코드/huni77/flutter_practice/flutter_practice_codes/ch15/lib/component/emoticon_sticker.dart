import 'package:flutter/material.dart';

// 스티커를 그리는 위젯
class EmoticonSticker extends StatefulWidget {
  final VoidCallback onTransform;
  final String imgPath; // 이미지 경로
  final bool isSelected;

  const EmoticonSticker({
    super.key,
    required this.onTransform,
    required this.imgPath,
    required this.isSelected,
  });

  @override
  State<EmoticonSticker> createState() => _EmoticonStickerState();
}

class _EmoticonStickerState extends State<EmoticonSticker> {
  double scale = 1; // 확대, 축소 배율
  double hTransform = 0; // 가로의 움직임
  double vTransform = 0; // 세로의 움직임
  double actualScale = 1; // 확대/축소 제스처가 끝나는 순간의 배율
  @override
  Widget build(BuildContext context) {
    return Transform( // child 위젯을 변형할 수 있는 위젯
      transform: Matrix4.identity()
        ..translate(hTransform, vTransform) // 상,하 움직임 정의
        ..scale(scale, scale), // 확대 축소 정의
      child: Container(
        decoration: widget.isSelected // 선택 상태일 때만 테두리 색상 구현
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), // 모서리 둥글게
                border: Border.all(
                  // 파란 테두리
                  color: Colors.blue,
                  width: 1.0,
                ))
            : BoxDecoration(
                // 테두리 투명, 너비 1로 설정해서 스티커가 선택, 취소될 때 깜빡이는 현상 제거
                border: Border.all(
                  width: 1.0,
                  color: Colors.transparent,
                ),
              ),
        child: GestureDetector(
          onTap: () {
            // 스티커를 눌렀을 때 실행할 함수
            widget
                .onTransform(); // 스티커의 상태가 변경될 때마다 실행, 스티커의 상태가 변경이 된다는 걸 부모 위젯에 알리는 역할
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            // 스티커의 확대 비율이 변경되었을 때 실행
            widget.onTransform();
            setState(() {
              // 현재 제스쳐가 시작된 순간 기준으로 '변경된 배율' '마지막 제스처의 배율' 을 곱해서 '실제 배율' 계산
              scale = details.scale * actualScale; // 위젯의 실제 초기 크기 대비 배울 계산

              // x 와 y 축을 기준으로 이동된 만큼 각각  hTransform vTransform 에 더해서 좌표를 이동
              vTransform += details.focalPointDelta.dy; // 세로 이동 거리 계산
              hTransform += details.focalPointDelta.dx; // 가로 이동 거리 계산
            });
          },
          onScaleEnd: (ScaleEndDetails details) {
            actualScale = scale; // 확대/축소 제스처가 끝나는 순간의 배율 저장
          }, // 스티커의 확대 비율 변경이 완료되었을 때 실행
          child: Image.asset(
            widget.imgPath,
          ),
        ),
      ),
    );
  }
}
