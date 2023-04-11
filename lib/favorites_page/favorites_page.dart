import 'package:flutter/material.dart';
import 'package:news_321/content_page/content_page.dart';
import 'package:news_321/list_page/ListPageEntity.dart';

List<Data> favoriteNews = [];

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏夹"),
      ),
      body: ListView.builder(
        itemCount: favoriteNews.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              toNewsContentPage(context, link: favoriteNews[index].link!);
            },
            title: Text(
              favoriteNews[index].title!,
            ),
            subtitle: Text(favoriteNews[index].date!),
          );
        },
      ),
    );
  }
}
