import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class RemoteNewsService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticles() async {
    var apiKey = "fdbf840272ef478ca1cda2f65c844b7f";
    var response = await client.get(
      Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-09-29&sortBy=publishedAt&apiKey=$apiKey",
      ),
      // 'https://newsapi.org/v2/everything?q=tesla&from=2023-09-22&sortBy=publishedAt&apiKey=${apiKey}'),
    );
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
