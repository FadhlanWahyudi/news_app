import 'package:flutter/material.dart';
import 'package:news_app/data/data_category.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/screen/news_page.dart';
import 'package:news_app/service/data_request.dart';
import 'package:news_app/widget/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: myAppbar(),
      body: SafeArea(
          child: FutureBuilder(
              future : news.getNews(),
              builder: (context, snapshot){
                //jika API memiliki Data
                if(snapshot.hasData){
                  return NewsPage(snapshot.data, categories);
                  //Jika APInya gagal/error
                }else if (snapshot.hasError){
                  return Center(child: Text('Data Tidak Di Temukan!!'));
                }

                return Center
                  (child: CircularProgressIndicator());
              },
          )
      ),
    );
  }
}
