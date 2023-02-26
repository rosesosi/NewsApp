import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/News.dart';
import 'package:news_app/view/news/NewsItemDetails.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsItemDetails.routeName,
            arguments: news);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                height: 200,
                width: double.infinity,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.author ?? '',
              textAlign: TextAlign.start,
            ),
            Text(
              news.title ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              news.publishedAt ?? '',
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
