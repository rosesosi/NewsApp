import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/NewsRepoImp.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/view/news/NewsListBlocViewModel.dart';
import 'package:news_app/view/news/news_item.dart';

class NewsList extends StatefulWidget {
  Source source;

  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  // @override
  NewsListBViewModel viewModel = NewsListBViewModel(injectNewsRepository());

  //NewsListBViewModel viewModel = NewsListBViewModel();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) => viewModel,
        child: BlocBuilder<NewsListBViewModel, NewsListState>(
            builder: (buildContext, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsListLoadState) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return NewsItem(state.newsList![index]);
              },
              itemCount: state.newsList?.length ?? 0,
            );
          } else if (state is ErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(state.errorMessage!),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id!);
                    },
                    child: const Text('Try Again'),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
      // child: Consumer<NewsListViewModel>(
      //   builder: (buildContext, viewModel, _) {
      //     if (viewModel.errorMessage != null) {
      //       return Column(
      //         children: [
      //           Text(viewModel.errorMessage!),
      //           ElevatedButton(
      //               onPressed: () {
      //                 viewModel.getNewsBySourceId(widget.source.id!);
      //               },
      //               child: Text('Try Again'))
      //         ],
      //       );
      //     } else if (viewModel.NewsList == null) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return ListView.builder(
      //       itemBuilder: (_, index) {
      //         return NewsItem(viewModel.NewsList![index]);
      //       },
      //       itemCount: viewModel.NewsList?.length ?? 0,
      //     );
      //   },
      // ),
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
    );
  }
}
