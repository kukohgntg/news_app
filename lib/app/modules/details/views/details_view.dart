import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:get/get.dart';

import '../../widgets/bottom_nav_bar.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("NEWS NOW"),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
    );
  }
}
