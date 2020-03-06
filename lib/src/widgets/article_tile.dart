import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/article.dart';
import '../models/article_data.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  ArticleTile({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.only(bottom: 16.0, right: 56.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Provider.of<ArticleData>(context, listen: false)
                .setArticle(article);
            Navigator.pushNamed(context, article.title);
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: article.urlToImage != ''
                    ? Image.network(article.urlToImage)
                    : const Image(image: AssetImage('images/no_image.png')),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            article.author,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Text(
                        article.description,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
