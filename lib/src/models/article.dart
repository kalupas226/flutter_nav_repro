class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  Article.fromJson(Map<String, dynamic> parsedJson)
      : author = parsedJson['author'] ?? '',
        title = parsedJson['title'] ?? '',
        description = parsedJson['description'] ?? '',
        url = parsedJson['url'] ?? '',
        urlToImage = parsedJson['urlToImage'] ?? '',
        content = parsedJson['content'] ?? '';
}
