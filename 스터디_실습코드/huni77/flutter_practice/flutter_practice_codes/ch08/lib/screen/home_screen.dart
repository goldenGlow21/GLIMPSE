import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse("https:/blog.codefactory.ai"))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  // const 생성자
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Code Factory'),
          centerTitle: true,
          // 1. AppBar에 액션 버튼을 추가하는 매개변수
          actions: [
            IconButton(
              onPressed: () => { // 버튼을 눌렀을 때 실행할 콜백
                webViewController // 웹뷰 위젯에서 사이트 전환하기
                    .loadRequest(Uri.parse('https:/blog.codefactory.ai'))
              },
              // 홈 버튼 아이콘 스타일 설정
              icon: Icon(
                Icons.home,
              ),
            )
          ],
        ),
        body: WebViewWidget(
          controller: webViewController,
        ));
  }
}
