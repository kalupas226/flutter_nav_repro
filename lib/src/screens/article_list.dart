import 'package:flutter/material.dart';
import '../widgets/article_tile.dart';
import 'package:provider/provider.dart';
import '../models/article_data.dart';
import '../models/article.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class ArticleList extends StatelessWidget {
  final SearchBarController<Article> _searchBarController =
      SearchBarController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleData>(
      builder: (context, articleData, child) {
        return SearchBar<Article>(
          searchBarController: _searchBarController,
          searchBarPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          headerPadding: const EdgeInsets.only(left: 16.0),
          listPadding: const EdgeInsets.all(16.0),
          onSearch:
              Provider.of<ArticleData>(context, listen: true).fetchArticles,
          emptyWidget: const Text('no result'),
          cancellationWidget: const Text('Cancel'),
          onItemFound: (Article article, int index) {
            return ArticleTile(article: article);
          },
        );
      },
    );
  }
}
