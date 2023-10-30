import 'dart:convert';

List<Article> newsArticleFromJson(String str) => List<Article>.from(json
    .decode(str)['articles']
    .map((x) => Article.fromJson(Map<String, dynamic>.from(x))));

class Article {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"].toString(),
        description: json["description"].toString(),
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"].toString(),
      );
}

class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
