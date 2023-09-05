import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/api_key.dart';

import '../models/top_head_lines_model/article.dart';

class ApiService {
  final baseUrl = 'https://newsapi.org/v2/top-headlines?';

  Future<List<Article>> getArticle(String country) async {
    Response result = await get(Uri.parse("${baseUrl}country=$country&apiKey=$apiKey"));
    if (result.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(result.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body
          .map((items) => Article.fromJson(items))
          .where((element) =>
             element.content != "[Removed]")
          .toList();
      return articles;
    } else {
      return [];
    }
  }
}
