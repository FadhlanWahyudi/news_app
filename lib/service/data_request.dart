import 'dart:convert';

import 'package:news_app/model/ResponseBerita.dart';
import 'package:http/http.dart' as http;

String apiKey = "719b4270d7d44b50aff0526d59eebfb5";

class News{
  Future<ResponseBerita> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}
class NewsByCategory{
  Future<ResponseBerita> getNewsByCategory(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}