import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../widgets/bottom_nav_bar.dart';

// import 'package:get/get.dart';

// import '../controllers/news_web_controller.dart';

class NewsWebView extends StatefulWidget {
  String url;
  NewsWebView({super.key, required this.url});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("NEWS NOW"),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
