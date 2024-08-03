import 'package:blog_web_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() {

  if (Platform.isAndroid) {
    WebView.platform = SurfaceAndroidWebView();
  } else if (Platform.isIOS) {
    WebView.platform = CupertinoWebView();
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}