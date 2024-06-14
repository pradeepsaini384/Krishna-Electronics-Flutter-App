import 'dart:async'; // Add this import statement

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishna Electronics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBrowser(), // Removed the title parameter here
    );
  }
}

class MyBrowser extends StatefulWidget {
  @override
  _MyBrowserState createState() => _MyBrowserState();
}

class _MyBrowserState extends State<MyBrowser> {
  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          // Optional: to change the status bar color
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.krishnaelectronics.online/public/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
