import 'package:news_app/api/api_manager.dart';
import 'package:news_app/domain/model/Source.dart';
import 'package:news_app/domain/repository/SourcesRepositoryContract.dart';

class SourcesRemoteDataSource implements SourcesDataSource {
  ApiManager apiManager;

  SourcesRemoteDataSource(this.apiManager);

  @override
  Future<List<Source>?> getSources(String CategoryId) async {
    var data = await apiManager.getSources(CategoryId);
    // converion from dto to domain models
    return data.sources?.map((sourceDTO) => sourceDTO.toDominSource()).toList();
  }
}

SourcesDataSource injectSourceDataSource() {
  return SourcesRemoteDataSource(ApiManager.getInstance());
}
