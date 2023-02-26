import 'package:flutter/material.dart';
import 'package:news_app/base/BaseState.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/view/news/NewsListViewModel.dart';
import 'package:news_app/view/news/news_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseState<NewsList, NewsListViewModel>
    implements NewsListNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
        child: Consumer<NewsListViewModel>(
          builder: (buildContext, viewModel, _) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNewsBySourceId(widget.source.id!);
                      },
                      child: Text('Try Again'))
                ],
              );
            } else if (viewModel.NewsList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(viewModel.NewsList![index]);
              },
              itemCount: viewModel.NewsList?.length ?? 0,
            );
          },
        ),
        // child: FutureBuilder<NewsResponse>(
        //   future: ApiManager.getNews(sourceId: source.id ?? ''),
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
        //       return Center(
        //         child: Text('Server error ${snapshot.data?.message}'),
        //       );
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

  @override
  void goToHomeScreen() {
    // TODO: implement goToHomeScreen
  }

  @override
  NewsListViewModel initViewModel() {
    return NewsListViewModel();
  }
}
