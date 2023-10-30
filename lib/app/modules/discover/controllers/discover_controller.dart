import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/Remote_Service.dart';
import '../../../data/models/news_model.dart';
// import '../../../data/models/Article_Models.dart';
// import 'package:flutter_news_app/data/api/Remote_Service.dart';
// import 'package:flutter_news_app/data/models/Article_Models.dart';

class NewsController extends GetxController {
  var future = <Article>[].obs;
  var searchTerm = ''.obs;
  var isSearching = false.obs;
  var searchController = TextEditingController();
  var categoryItems = [
    "GENERAL",
    "BUSINESS",
    "ENTERTAINMENT",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
    "TECHNOLOGY",
  ];

  var selectedCategory = "GENERAL".obs;

  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }

  Future<void> getNewsData() async {
    final newsAPI = NewsAPI("fdbf840272ef478ca1cda2f65c844b7f");
    future.value = await newsAPI.getTopHeadlines(
      country: "us",
      query: searchTerm.value,
      category: selectedCategory.value,
      pageSize: 50,
    );
  }

  void setSearchTerm(String term) {
    searchTerm.value = term;
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
    getNewsData();
  }

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchTerm.value = '';
      searchController.text = '';
      getNewsData();
    }
  }
}
