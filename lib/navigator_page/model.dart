import 'package:dio/dio.dart';
import 'package:news_321/navigator_page/entity.dart';


class NewsTypeModel{
  NewsTypeEntity? entity;
  Future<NewsTypeEntity?> getData()async{
    try {
      Response res = await Dio().get("http://118.195.147.37:5672/news/type");
      entity = NewsTypeEntity.fromJson(res.data);
      return entity;
    }catch(e){
      return null;
    }
  }
}