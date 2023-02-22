import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/utils/News.dart';

class NewsListBViewModel extends Cubit<NewsListState> {
  NewsListBViewModel() : super(LoadingState());

  void getNewsBySourceId(String sourceID) async {
    try {
      var response = await ApiManager.getNews(sourceId: sourceID);
      if (response.status == 'error') {
        emit(ErrorState(response.message!));
        // errorMessage = response.message;
      } else {
        emit(NewsListLoadState(response.articles!));
        // NewsList = response.articles;
      }
    } catch (e) {
      emit(ErrorState("Error loading News"));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {}

class ErrorState extends NewsListState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class NewsListLoadState extends NewsListState {
  List<News> newsList;

  NewsListLoadState(this.newsList);
}
