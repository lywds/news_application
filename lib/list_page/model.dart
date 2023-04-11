import 'package:dio/dio.dart';
import 'package:news_321/navigator_page/entity.dart';
import 'package:news_321/list_page/ListPageEntity.dart';
import 'package:news_321/list_page/list_page.dart';

class NewsListModel {
  ListPageEntity? entity;
  Future<ListPageEntity?> getData({required String type,int page=1})async{
    try {
      Response res = await Dio().get("http://118.195.147.37:5672/news/list",queryParameters: {
        "type":type,
        "page":page,
      });
      entity = ListPageEntity.fromJson(res.data);
      return entity;
    }catch(e){
      return null;
    }
  }
}