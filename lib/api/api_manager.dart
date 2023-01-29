import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/utils/NewsResponse.dart';
import 'package:news_app/utils/SourcesResponsee.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '59d730d09d1f4b37bc4c90ccd923fdbc';

  static Future<SourcesResponsee> getSources(String categoryID) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      //paramters
      'apiKey': apiKey,
      'category': categoryID
    });
    var response = await http.get(url);
    // var bodyString = response.body;
    // var json = jsonDecode(bodyString);
    //
    // return SourcesResponsee.fromJson(json);

    return SourcesResponsee.fromJson(jsonDecode(response.body));

    // http.get(Uri.parse('a7ot kol url bs msh a7sn 7aga 3shan baramter btt3yer))
  }

  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyword}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
      'q': searchKeyword,
    });
    var responce = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(responce.body));
  }
}
