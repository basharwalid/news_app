import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/model/sources_response/SourcesResponse.dart';

class apiManager {
  static const String apiKey = "071bffa586ea4d239fdde32685c9a784";
  static const String baseUrl = "newsapi.org";
  static Future<SourcesResponse> getNewsSources() async {
    // ?apiKey=071bffa586ea4d239fdde32685c9a784
    var uri =
        Uri.https(baseUrl, "v2/top-headlines/sources", {"apiKey": apiKey});
    var response = await http.get(uri);
    var jsonString = response.body;
    var sourcesresponse = SourcesResponse.fromJson(jsonDecode(jsonString));
    return sourcesresponse;
  }
}
