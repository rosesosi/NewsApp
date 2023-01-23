import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/utils/SourcesResponsee.dart';
import 'package:news_app/utils/category.dart';
import 'package:news_app/view/category/CategoryTabWidget.dart';
import 'package:news_app/view/searchPage.dart';
// import 'package:http/http.dart' as http;

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'NewsDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final Category args =
        ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(args.categoryTitle),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: FutureBuilder<SourcesResponsee>(
          future: ApiManager.getSources(args.categoryId),
          builder: (buildContext, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error Loading data ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.data?.status == 'error') {
              return Center(
                child: Text('Server error ${snapshot.data?.message}'),
              );
            }
            var sources = snapshot.data?.sources;
            return CategoryTabsWidget(sources!);
          },
        ),
      ),
    );
  }
}
