import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/model/sources_response/News.dart';
import 'package:newsapp/api/model/sources_response/NewsResponse.dart';
import 'package:newsapp/api/model/sources_response/Source.dart';
import 'package:newsapp/api/model/sources_response/SourcesResponse.dart';

class apiManager {
  static const String apiKey = "071bffa586ea4d239fdde32685c9a784";
  static const String baseUrl = "newsapi.org";
  static Future<SourcesResponse> getNewsSources(String categoryId) async {
    // ?apiKey=071bffa586ea4d239fdde32685c9a784
    var uri =
        Uri.https(baseUrl, "v2/top-headlines/sources", {"apiKey": apiKey , 'category' : categoryId});
    var response = await http.get(uri);
    var jsonString = response.body;
    var sourcesresponse = SourcesResponse.fromJson(jsonDecode(jsonString));
    return sourcesresponse;
  }

  static Future<NewsResponse>getNews(String sourceId)async{
    var url = Uri.https(baseUrl , "v2/everything" , {"apiKey": apiKey , 'sources' : sourceId});
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
  static Future<NewsResponse> Searchin({String? dataSource , String? query}) async{
    Uri url = Uri.https(
        baseUrl,
        "/v2/everything",
        {
          "apiKey" : apiKey ,
          'sources' : dataSource ,
          'q' : query ,
        }
    );
    var response =  await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));

  }
}
