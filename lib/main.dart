import 'package:flutter/material.dart';
import 'package:news_321/navigator_page/navigator.dart';
main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  NavigatorPage(),
    );
  }
}
