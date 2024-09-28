import 'package:cf_tube/const/api.dart';
import 'package:cf_tube/model/video_model.dart';
import 'package:dio/dio.dart';

class YoutubeRepository {
  // 비동기로 동영상 정보를 받아오는 getVideos()함수
  static Future<List<VideoModel>> getVideos() async {
    // GET 메소드 보내기
    final resp = await Dio().get(
      YOUTUBE_API_BASE_URL, // 요청을 보낼 URL
      queryParameters: {   // 요청에 포함할 쿼리 변수들
        'channelId': CF_CHANNEL_ID,
        'maxResults': 5,
        'key': API_KEY,
        'part': 'snippet',
        'order': 'date',
      },
    );

    final listWithData = resp.data['items'].where(
      (item) =>
          item?['id']?['videoId'] != null && item?['snippet']?['title'] != null,
    ); // videoId와 title 이  null 이 아닌 값들만 필터링

    return listWithData
        .map<VideoModel>(
          (item) => VideoModel(
            id: item['id']['videoId'],
            title: item['snippet']['title'],
          ),
        )
        .toList(); // 필터링된 값들을 기반으로 VideoModel 생성
  }
}
