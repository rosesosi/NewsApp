import 'package:news_app/api/api_manager.dart';
import 'package:news_app/base/base_navigator.dart';
import 'package:news_app/base/base_viewModel.dart';
import 'package:news_app/utils/News.dart';

abstract class NewsListNavigator implements BaseNavigator {}

///////////////////////////////////////////////////////////////////

class NewsListViewModel extends BaseViewModel<NewsListNavigator> {
  List<News>? NewsList;
  String? errorMessage = null;

  getNewsBySourceId(String sourceID) async {
    errorMessage = null;
    NewsList = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(sourceId: sourceID);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        NewsList = response.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News';
    }
    notifyListeners();
  }
}
