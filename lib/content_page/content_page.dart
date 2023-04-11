import 'package:flutter/material.dart';
import 'package:news_321/content_page/ContentPageEntity.dart';
import 'package:news_321/content_page/content_pdf.dart';
import 'package:news_321/content_page/model.dart';
import 'package:news_321/list_page/ListPageEntity.dart'; // 引入ListPageEntity
import 'package:news_321/favorites_page/favorites_page.dart'; // 引入favorites_page

toNewsContentPage(BuildContext context, {required String link}) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NewsContentPage(link: link)));
}

class NewsContentPage extends StatefulWidget {
  final String link;
  NewsContentPage({Key? key, required this.link}) : super(key: key);

  @override
  _NewsContentPageState createState() => _NewsContentPageState();
}

class _NewsContentPageState extends State<NewsContentPage> {

  NewsContentModel model = NewsContentModel();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }


// 添加一个方法，用于检查当前新闻是否已收藏
  void _checkIfFavorite() {
    if (favoriteNews.any((news) => news.link == widget.link)) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  void _addToFavorites(ContentPageEntity data) {
    bool alreadyExists = favoriteNews.any((news) => news.link == widget.link);
    if (alreadyExists) {
      setState(() {
        favoriteNews.removeWhere((news) => news.link == widget.link);
        isFavorite = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('已取消收藏此新闻！'),
        ),
      );
    } else {
      setState(() {
        favoriteNews.add(Data(
          title: data.title,
          date: data.date,
          link: widget.link,
        ));
        isFavorite = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('已收藏此新闻！'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: model.getData(link: widget.link),
        builder:
            (BuildContext context, AsyncSnapshot<ContentPageEntity?> snapshot) {
          if (snapshot.hasData) {
            String? prevType;
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data!.title!),
                actions: [
                  IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      _addToFavorites(snapshot.data!);
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: snapshot.data!.contents!.length,
                  itemBuilder: (BuildContext context, int index) {
                    String? currType = snapshot.data!.contents![index].type;
                    Widget widget;

                    switch (currType) {
                      case "text":
                        widget = RichText(
                          textAlign: prevType == "image"
                              ? TextAlign.center
                              : TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: prevType == "image" ? '' : '\u3000\u3000',
                                style: DefaultTextStyle.of(context).style,
                              ),
                              TextSpan(
                                text: snapshot.data!.contents![index].content!,
                                style: DefaultTextStyle.of(context).style,
                              ),
                              TextSpan(
                                text: '\n',
                                style: DefaultTextStyle.of(context).style,
                              ),
                            ],
                          ),
                        );
                        break;
                      case "image":
                        widget = Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image(
                              image: NetworkImage(
                                  snapshot.data!.contents![index].content!)),
                        );
                        break;
                      case "pdf":
                        print(snapshot.data!.contents![index].content!);
                        widget =
                            Pdf(url: snapshot.data!.contents![index].content!);
                        break;
                      default:
                        widget = Text(snapshot.data!.contents![index].content!);
                        break;
                    }
                    prevType = currType;
                    return widget;
                  }),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text(
                      "正在加载...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
