import 'package:news_app/data/dataSource/NewsRemoteDataSource.dart';
import 'package:news_app/domain/repository/NewsRepositoryContract.dart';
import 'package:news_app/model/News.dart';

class NewsRepoImpl implements NewsRepositoryContract {
  NewsDataSource dataSource;

  NewsRepoImpl(this.dataSource);

  @override
  Future<List<News>?> getNewsBySourceID(String sourceId) {
    return dataSource.getNewsBySourceID(sourceId);
  }
}

NewsRepositoryContract injectNewsRepository() {
  return NewsRepoImpl(injectNewsDataSource());
}
