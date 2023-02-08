import 'package:news_app/api/api_manager.dart';
import 'package:news_app/base/base_navigator.dart';
import 'package:news_app/base/base_viewModel.dart';
import 'package:news_app/utils/Source.dart';

abstract class NewsNavigator implements BaseNavigator {}

class CategoryNewsListViewModel extends BaseViewModel<NewsNavigator> {
  List<Source>? sources = null;
  String? errorMessage = null;

  void loadNewsSources(String categoryId) async {
    try {
      var responce = await ApiManager.getSources(categoryId);
      sources = responce.sources;
    } catch (e) {
      navigator?.showMessage("error getting source");
      errorMessage = 'error getting source';
    }
    notifyListeners();
  }
}
