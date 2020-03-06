import 'package:flutter/material.dart';
import 'screens/article_list.dart';
import 'package:provider/provider.dart';
import 'models/article_data.dart';
import 'screens/article_detail.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleData()),
      ],
      child: MaterialApp(
        title: 'Flutter nav repro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: routes,
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  if (settings.name == '/') {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter nav repro'),
          ),
          body: ArticleList(),
        );
      },
      settings: settings,
    );
  } else {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter nav repro'),
          ),
          body: ArticleDetail(),
        );
      },
      settings: settings,
    );
  }
}
