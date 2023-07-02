import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/model/sources_response/News.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
            child:CachedNetworkImage(
              imageUrl: news.urlToImage??"NO Image Found" , height: 200,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
        ),
        Text(news.author??"No Title" ,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium,

        ),
        Text(news.title??"" ,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.black
          ),
          textAlign: TextAlign.start,
        ),
        Text(news.publishedAt??"",
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}
