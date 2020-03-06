import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article.dart';

class ArticleData extends ChangeNotifier {
  Article _article;
  List<Article> _articles = [];

  Article get article => _article;

  UnmodifiableListView<Article> get articles {
    return UnmodifiableListView(_articles);
  }

  Future<List<Article>> fetchArticles(String searchText) async {
    removeArticles();
    // TODO: please input your api key from https://newsapi.org/
    final String apiKey = 'c4863ae1cf1c4816927e54a8ef65c824';
    String url = 'http://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=$apiKey';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final articlesRawJson = utf8.decode(response.bodyBytes);
      final articlesJson = json.decode(articlesRawJson)['articles'];
      for (var articleJson in articlesJson) {
        print(articleJson);
        Article article = Article.fromJson(articleJson);
        addArticle(article);
      }
      notifyListeners();
      return _articles;
    } else {
      print('failed');
      throw Exception('Failed to fetch Articles');
    }
  }

  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void removeArticles() {
    _articles.clear();
    notifyListeners();
  }

  void setArticle(Article article) {
    _article = article;
    notifyListeners();
  }
}

