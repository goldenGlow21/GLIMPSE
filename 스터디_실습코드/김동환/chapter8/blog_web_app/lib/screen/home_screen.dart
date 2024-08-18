import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // 1. WebViewController 선언
  WebViewController webViewController = WebViewController()
  // 2. WebViewController의 loadRequest() 함수 실행
  ..loadRequest(Uri.parse('https://blog.codefactory.ai'))
  // 3. Javascript가 제한 없이 실행될 수 있도록 한다.
  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,

        // 1. appBar에 액션버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
              // 2. 아이콘을 눌렀을 때 실행할 콜백함수
              onPressed: () {

            // 3. 웹뷰 위젯에서 사이트 전환하기
                webViewController.loadRequest(Uri.parse('https://blog.codefactory.ai'));
          },

          // 4. 홈 버튼 아이콘 설정
          icon: Icon(
            Icons.home,
          ),
        ),
      ],
    ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}