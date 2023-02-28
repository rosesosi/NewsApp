import 'package:news_app/data/dataSource/NewsRemoteDataSource.dart';
import 'package:news_app/domain/model/News.dart';
import 'package:news_app/domain/repository/NewsRepositoryContract.dart';

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
