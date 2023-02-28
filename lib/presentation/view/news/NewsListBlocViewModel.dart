import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/model/News.dart';
import 'package:news_app/domain/usecases/GetNewsBySourceIDUseCase.dart';

class NewsListBViewModel extends Cubit<NewsListState> {
  GetNewsBySourceIDUseCase getNewsBySourceIDUseCase;

  // NewsRepositoryContract repositoryContract;
  //NewsListBViewModel(this.repositoryContract) : super(LoadingState());
  NewsListBViewModel(this.getNewsBySourceIDUseCase) : super(LoadingState());

  void getNewsBySourceId(String sourceID) async {
    try {
      // var newslist = await repositoryContract.getNewsBySourceID(sourceID);
      var newslist = await getNewsBySourceIDUseCase.invoke(sourceID);

      // var response = await ApiManager.getNews(sourceId: sourceID);
      //  if (response.status == 'error') {
      //    emit(ErrorState(response.message!));
      //    // errorMessage = response.message;
      //  }

      if (newslist == null) {
        emit(ErrorState("Error loading News"));
      } else {
        emit(NewsListLoadState(newslist));
        // emit(NewsListLoadState(response.articles!));
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
