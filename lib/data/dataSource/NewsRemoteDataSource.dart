import 'package:news_app/api/api_manager.dart';
import 'package:news_app/domain/repository/NewsRepositoryContract.dart';
import 'package:news_app/model/News.dart';

class NewsRemoteDataSource implements NewsDataSource {
  ApiManager apiManager;

  NewsRemoteDataSource(this.apiManager);

  @override
  Future<List<News>?> getNewsBySourceID(String sourceId) async {
    var response = await apiManager.getNews(sourceId: sourceId);
    return response.articles;
  }
}

NewsDataSource injectNewsDataSource() {
  return NewsRemoteDataSource(ApiManager.getInstance());
}
