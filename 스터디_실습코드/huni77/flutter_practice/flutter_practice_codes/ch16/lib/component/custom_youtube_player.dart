import 'package:cf_tube/model/video_model.dart';
import 'package:flutter/material.dart';

// 유튜브 재생기를 사용하기 위해 패키지 불러오기
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// 유튜브 동영상 재생기가 될 위젯
class CustomYoutubePlayer extends StatefulWidget {
  // 상위 위젯에서 입력받을 동영상 정보
  final VideoModel videoModel;

  const CustomYoutubePlayer({
    super.key,
    required this.videoModel,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? controller; // 컨트롤러 생성

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController( // 1. 컨트롤러 선언
      initialVideoId: widget.videoModel.id, // 처음 실행할 동영상의 ID
      flags: YoutubePlayerFlags(
        autoPlay: false, // 자동실행 사용 안하기
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer( // 유튜브 동영상을 재생할 수 있는 위젯
          controller: controller!,
          showVideoProgressIndicator: true, // 동영상 진행 상황을 알려주는 슬라이더 보여주기
        ),
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.videoModel.title, // 동영상 제목
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose(); // State 폐기 시 컨트롤러 또한 폐기
  }
}
