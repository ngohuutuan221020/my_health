import 'package:flutter/material.dart';
import 'package:suc_khoe_app/info_screen.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewYTe extends StatefulWidget {
  @override
  WebViewYTeState createState() => WebViewYTeState();
}

class WebViewYTeState extends State<WebViewYTe> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Khai báo y tế",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: WebView(
        initialUrl: 'https://tokhaiyte.vn/',
      ),
    );
  }
}
