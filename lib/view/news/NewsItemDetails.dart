import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatefulWidget {
  static const String routeName = 'ItemDetails';

  @override
  State<NewsItemDetails> createState() => _NewsItemDetailsState();
}

class _NewsItemDetailsState extends State<NewsItemDetails> {
  String formatDateNews(String newsDate) {
    DateFormat inputDateFormater = DateFormat(newsDate);
    DateFormat outputFormatter = DateFormat('yyyy/MMM/dd - hh:mm a');

    DateTime inputDate = inputDateFormater.parse(newsDate ?? '');
    String outPutDateString = outputFormatter.format(inputDate);
    return outPutDateString;
  }

// open in the same app
  Future<void> openUrlInApp(String? url) async {
    if (url == null) {
      return;
    }
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Colud not launch $url';
    }
  }

  //open in extrnal browser
  Future<void> openUrlInBrowser(String? url) async {
    if (url == null) {
      return;
    }
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'could not lanch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final News argsNews = ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(argsNews.title!),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/pattern.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: argsNews.urlToImage ?? '',
                height: 200,
                width: double.infinity,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              argsNews.author ?? '',
              textAlign: TextAlign.start,
            ),
            Text(
              argsNews.title ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              formatDateNews(argsNews.publishedAt ?? ''),
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              argsNews.content ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View Full Articals',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Color(0xFF42505c), fontSize: 14),
                ),
                IconButton(
                    onPressed: () {
                      openUrlInApp(argsNews.url);
                    },
                    icon: Icon(
                      Icons.arrow_circle_right,
                      size: 25,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
