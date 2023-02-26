import 'package:news_app/data/dataSource/SourcesRemoteDataSource.dart';
import 'package:news_app/domain/repository/SourcesRepositoryContract.dart';
import 'package:news_app/model/Source.dart';

class SourceRepositryImp extends SourcesRepositiryContract {
  SourcesDataSource dataSource;

  SourceRepositryImp(this.dataSource);

  @override
  Future<List<Source>?> getSources(String categoryID) {
    return dataSource.getSources(categoryID);
  }
}

SourcesRepositiryContract injectSourceRepo() {
  return SourceRepositryImp(injectSourceDataSource());
}
