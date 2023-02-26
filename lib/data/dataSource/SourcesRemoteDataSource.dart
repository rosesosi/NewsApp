import 'package:news_app/api/api_manager.dart';
import 'package:news_app/domain/repository/SourcesRepositoryContract.dart';
import 'package:news_app/model/Source.dart';

class SourcesRemoteDataSource implements SourcesDataSource {
  ApiManager apiManager;

  SourcesRemoteDataSource(this.apiManager);

  @override
  Future<List<Source>?> getSources(String CategoryId) async {
    var data = await apiManager.getSources(CategoryId);
    return data.sources;
  }
}

SourcesDataSource injectSourceDataSource() {
  return SourcesRemoteDataSource(ApiManager.getInstance());
}
