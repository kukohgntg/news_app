import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/api/remote_service.dart';
import '../../../data/models/news_model.dart';

class ArticleController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articles = await RemoteNewsService.fetchNewsArticles();
      if (articles != null) {
        newsArticles(articles);
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
