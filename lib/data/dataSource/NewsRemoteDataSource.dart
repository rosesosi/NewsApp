import 'package:news_app/api/api_manager.dart';
import 'package:news_app/domain/model/News.dart';
import 'package:news_app/domain/repository/NewsRepositoryContract.dart';

class NewsRemoteDataSource implements NewsDataSource {
  ApiManager apiManager;

  NewsRemoteDataSource(this.apiManager);

  @override
  Future<List<News>?> getNewsBySourceID(String sourceId) async {
    var response = await apiManager.getNews(sourceId: sourceId);
    // mapping to a new list of news ,
    return response.articles?.map((newsDTO) => newsDTO.toDomainNews()).toList();
  }
}

NewsDataSource injectNewsDataSource() {
  return NewsRemoteDataSource(ApiManager.getInstance());
}
