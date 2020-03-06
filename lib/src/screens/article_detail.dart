import 'package:flutter/material.dart';
import '../models/article_data.dart';
import 'package:provider/provider.dart';

class ArticleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleData>(
      builder: (context, articleData, child) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: articleData.article.urlToImage != ''
                        ? Image.network(
                            articleData.article.urlToImage,
                            cacheHeight: 400,
                          )
                        : const Image(
                            image: AssetImage('images/no_image.png'),
                          ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Expanded(
                          flex: 1,
                          child: Text(
                            articleData.article.title,
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              articleData.article.description ?? 'no description',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
