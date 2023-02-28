import 'package:news_app/domain/model/News.dart';
import 'package:news_app/domain/repository/NewsRepositoryContract.dart';

class GetNewsBySourceIDUseCase {
  NewsRepositoryContract newsRepository;

  GetNewsBySourceIDUseCase(this.newsRepository);

  Future<List<News>?> invoke(String SourceId) async {
    // get news from repositry
    var data = await newsRepository.getNewsBySourceID(SourceId);
    //data.where((news) => news.author == 'rose').toList();

    return data;
  }
}
