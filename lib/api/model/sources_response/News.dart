import 'Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Stephen Lawrence murder: How I found the new suspect 30 years on"
/// description : "Racism killed Stephen and it was blocking the truth about the case - writes Daniel De Simone."
/// url : "https://www.bbc.co.uk/news/uk-66034335"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/110D5/production/_130254896_stephen-lawrence-superpromo-1200.jpg"
/// publishedAt : "2023-06-30T23:37:17Z"
/// content : "Earlier this week, the BBC publicly named a major suspect in the Stephen Lawrence murder. In response, Stephen's mother Baroness Doreen Lawrence said, \"It should not have taken a journalist to do the… [+10639 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}