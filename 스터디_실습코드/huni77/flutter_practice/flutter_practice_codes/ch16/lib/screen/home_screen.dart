import 'package:cf_tube/component/custom_youtube_player.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:cf_tube/repository/youtube_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true, // 제목 가운데 정렬
        title: Text(
          '코팩튜브',
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: YoutubeRepository.getVideos(), // 유튜브 영상 가져오기
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // 에러 표시
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (!snapshot.hasData) {
            // 로딩중 표시
            return Center(
              child: CircularProgressIndicator(), // 로딩 위젯
            );
          }
          return RefreshIndicator(
            child: ListView(
              // List<VideoModel> 을 CustomYoutubePlayer 로 매핑
              physics: BouncingScrollPhysics(), // 아래로 당겨서 스크롤할 때 튕기는 애니메이션 추가
              children: snapshot.data!
                      ?.map((e) => CustomYoutubePlayer(videoModel: e))
                      .toList() ??
                  [], // snapshot.data가 null이 아닌지 확인하는 조건을 추가
            ),
            onRefresh: () async {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
