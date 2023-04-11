import 'package:flutter/material.dart';
import 'package:news_321/navigator_page/entity.dart';
import 'package:news_321/list_page/list_page.dart';
import 'package:news_321/navigator_page/model.dart';
import 'package:news_321/favorites_page/favorites_page.dart'; // 导入收藏页面模块

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> with SingleTickerProviderStateMixin {
  //late 使用时才赋值
  late final TabController _controller = TabController(length: model.entity!.data!.length, vsync: this);
  NewsTypeModel model = NewsTypeModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: model.getData(),
        builder: (BuildContext context, AsyncSnapshot<NewsTypeEntity?> snapshot) {
          //判断snapshot是否已经返回数据
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text("矿大新闻"),
                bottom: TabBar(
                  isScrollable: true,
                  controller: _controller,
                  tabs: snapshot.data!.data!.map((item){
                    return Tab(
                      text: item.name,
                    );
                  }).toList(),
                ),
                actions: [
                  // 添加收藏夹文字
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(child: Text('收藏夹')),
                  ),
                  // 添加收藏按钮
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritesPage()), // 跳转到收藏页面
                      );
                    },
                  ),
                ],
              ),
              body: TabBarView(
                controller: _controller,
                children:snapshot.data!.data!.map((item){
                  return NewsListPage(type: item.type!);
                }).toList(),
              ),
            );
          }else{
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Text("waiting"),
              ),
            );
          }
        }
    );
  }
}
