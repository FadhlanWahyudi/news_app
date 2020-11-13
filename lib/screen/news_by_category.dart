import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/ResponseBerita.dart';
import 'package:news_app/service/data_request.dart';
import 'package:news_app/widget/news_item.dart';
import 'package:news_app/widget/widget.dart';

class NewsByCategories extends StatefulWidget {

  final String newsCategory;

   NewsByCategories({this.newsCategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newsCategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {

  NewsByCategory newsByCategory = NewsByCategory();
  String newsCategory;

  _NewsByCategoriesState(this.newsCategory);


  @override
  void initState(){
    super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppbar(),
      body: FutureBuilder(
        future: newsByCategory.getNewsByCategory(newsCategory),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListNewsCategory(snapshot.data);
          }else if(snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Data Tidak di Temukan'));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
class ListNewsCategory extends StatelessWidget {

  ResponseBerita responseBerita;
  ListNewsCategory(this.responseBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: ListView.builder(
            itemCount: responseBerita.articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index){
              return NewsItem(
                imgUrl: responseBerita.articles[index].urlToImage ?? "",
                title: responseBerita.articles[index].title ?? "",
                decs: responseBerita.articles[index].description ?? "",
                content: responseBerita.articles[index].content ?? "",
                postUrl: responseBerita.articles[index].url ?? "",
                name: responseBerita.articles[index].source.name ?? "",
              );
            }
        ),
      ),
    );
  }
}

