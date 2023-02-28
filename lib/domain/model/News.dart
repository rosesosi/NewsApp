import 'package:news_app/domain/model/Source.dart';

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "Caleigh Bartash"
/// title : "4 dead, 1 injured after small plane crashes in Texas"
/// description : "Four members of Tennessee's Harvest Church were killed and one was hospitalized after a small plane crash near Victoria, Texas."
/// url : "https://abcnews.go.com/US/4-dead-after-small-plane-crash-lavaca-county/story?id=96498346"
/// urlToImage : "https://s.abcnews.com/images/US/texas-crash2_1674034613537_hpMain_16x9_992.jpg"
/// publishedAt : "2023-01-18T09:44:48Z"
/// content : "Four passengers were killed and another was hurt after a small plane crashed in Lavaca County, Texas, on Tuesday morning, the states Department of Public Safety said.\r\nThe injured survivor was taken … [+1735 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
}
