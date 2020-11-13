import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/widget/category_item.dart';
import 'package:news_app/model/ResponseBerita.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/widget/news_item.dart';

class NewsPage extends StatelessWidget {
  ResponseBerita responseBerita;
  List<Category> categories;

  NewsPage(this.responseBerita,this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder:(contenxt, index){
                    return CategoryItem(
                      categoryName: categories[index].categoryImage,
                      imageAssetUrl: categories[index].imageUrl,
                    );
                  }
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
