import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// 로고를 보여줄 위젯
class _Logo extends StatelessWidget {
  final GestureTapCallback onTap; // 탭했을 때 실행할 함수
  const _Logo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 3. 상위 위젯으로부터 탭 콜백 받기
      child: Image.asset('asset/img/logo.png'),
    );
  }
}

// 앱 제목 출력하는 위젯
class _AppName extends StatelessWidget {
  const _AppName({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Video', style: textStyle),
        Text(
          'Player',
          style: textStyle.copyWith(
            fontWeight: FontWeight.w700, // textStyle 에서 폰트 두께만 700으로 변경
          ),
        )
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video; // 1. 동영상 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 2. 동영상이 선택됐을 때, 선택 안됐을 때 보여줄 위젯, 조건부 연산자로 구현
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderEmpty() {
    // 3. 동영상 선택 전 보여줄 위젯
    return Container(
      width: MediaQuery.of(context).size.width, // 너비 최대로 늘리기
      decoration: getBoxDecoration(), // 1. getBoxDecoration() 함수로부터 값 가져오기
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(
            onTap: onNewVideoPressed,
          ),
          // 1. 로고 탭하면 실행하는 함수 onNewVideoPressed 전달
          SizedBox(
            height: 30.0,
          ),
          _AppName(),
        ],
      ),
    );
  }

  // 2. 이미지 선택하는 기능을 구현한 함수
  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
        // 2. 그라데이션 색상 적용하기
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xFF2A3A7C),
          Color(0xFF000118),
        ]));
  }

  Widget renderVideo() {
    // 4. 동영상 선택 후 보여줄 위젯
    return Center(
      child: CustomVideoPlayer(
        video: video!,
        onNewVideoPressed: onNewVideoPressed,
      ), // 2. 선택된 동영상 입력해주기
    );
  }
}
