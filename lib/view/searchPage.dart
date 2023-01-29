import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/utils/News.dart';
import 'package:news_app/view/news/news_item.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'Search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? query = ' ';
  List<News> newDataList = [];

  List<News> search() {
    ApiManager.getNews(searchKeyword: query).then((newResponse) {
      newDataList = newResponse.articles ?? [];
    }).catchError((error) {
      print('error during search !! $error');
    });
    return newDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          leadingWidth: 10,
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: TextField(
                onChanged: (String text) {
                  setState(() {
                    query = text;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    hintText: 'Search...',
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(57, 165, 82, 0.3)),
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Container(
          padding: EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pattern.png'))),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (_, index) {
                  return NewsItem(search()[index]);
                },
                itemCount: search().length,
              ))
            ],
          )
          //      child : FutureBuilder<NewsResponse>(
          //      future: ApiManager.getNews(searchKeyword : query ?? '' ),
          //   builder: (buildContext, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error Loading data ${snapshot.error.toString()}'),
          //       );
          //     }
          //     if (snapshot.data?.status == 'error') {
          //
          //         return Center(
          //           child: Text('Server error ${snapshot.data?.message}'),
          //         );
          //
          //     }
          //     var newsList = snapshot.data?.articles;
          //     return ListView.builder(
          //       itemBuilder: (_, index) {
          //         return NewsItem(newsList![index]);
          //       },
          //       itemCount: newsList?.length ?? 0,
          //     );
          //   },
          // ),
          ),
    );
  }
}
