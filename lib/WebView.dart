import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  Completer<WebViewController> _controller =  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WEBVIEW"),),
      body: WebView(
        initialUrl: 'http://dizytech.co.id/',
        javascriptMode: JavascriptMode.unrestricted, //by default javascript disabled
        onWebViewCreated: (WebViewController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}