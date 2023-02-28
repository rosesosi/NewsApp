import 'package:news_app/domain/model/News.dart';

abstract class NewsRepositoryContract {
  Future<List<News>?> getNewsBySourceID(String sourceId);
}

abstract class NewsDataSource {
  Future<List<News>?> getNewsBySourceID(String sourceId);
}
