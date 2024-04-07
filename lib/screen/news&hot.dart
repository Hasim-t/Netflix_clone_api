import 'package:flutter/material.dart';
import 'package:netflix__clone/notifier.dart';

import 'package:netflix__clone/widgets/news.dart';

class NewsHot extends StatefulWidget {
  const NewsHot({super.key});

  @override
  State<NewsHot> createState() => _NewsHotState();
}

class _NewsHotState extends State<NewsHot> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('News&Hot',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        actions: [Icon(Icons.cast, ), SizedBox(width: 10,), IconButton(onPressed: (){}, icon: Icon(Icons.search))],),
      body:  DisplayHotAndNews(news: trendingmovies.value),
    );
  }
}
