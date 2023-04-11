import 'package:dio/dio.dart';
import 'package:news_321/content_page/ContentPageEntity.dart';


class NewsContentModel {
  ContentPageEntity? entity;
  Future<ContentPageEntity?> getData({required String link})async{
    try {
      Response res = await Dio().get("http://118.195.147.37:5672/news/content",queryParameters: {
        "link":link,
      });
      entity = ContentPageEntity.fromJson(res.data);
      return entity;
    }catch(e){
      return null;
    }
  }
}