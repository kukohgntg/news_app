import 'package:http/http.dart';
import '../models/news_model.dart';

class NewsAPI {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _country = 'us';
  static const String _category = 'business';
  static const String _apiKey = 'fdbf840272ef478ca1cda2f65c844b7f';

  static Future<List<Article>?> fetchNewsArticles() async {
    var response = await get(Uri.parse(
        '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
