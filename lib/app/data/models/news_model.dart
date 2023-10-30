import 'dart:convert';

List<Article> newsArticleFromJson(String str) => List<Article>.from(json
    .decode(str)['articles']
    .map((x) => Article.fromJson(Map<String, dynamic>.from(x))));

class Article {
  final Source source;
  final String? author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content;

  Article(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      Source.fromJson(json["source"]),
      json["author"],
      json["title"],
      json["description"],
      json["url"],
      json["urlToImage"],
      json["publishedAt"],
      json["content"],
    );
  }

  static List<Article> parseList(List<dynamic> list) {
    return list.map((e) => Article.fromJson(e)).toList();
  }
}

class Source {
  final String? id, name, description, url, category, language, country;

  Source(
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  );

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      json["id"],
      json["name"],
      json["description"],
      json["url"],
      json["category"],
      json["language"],
      json["country"],
    );
  }

  static List<Source> parseList(List<dynamic> list) {
    return list.map((e) => Source.fromJson(e)).toList();
  }
}

class ApiError {
  final String? code, message;

  ApiError(this.code, this.message);

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      json["code"],
      json["message"],
    );
  }
}
