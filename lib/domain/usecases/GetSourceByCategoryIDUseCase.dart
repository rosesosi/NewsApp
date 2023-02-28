import 'package:news_app/domain/model/Source.dart';
import 'package:news_app/domain/repository/SourcesRepositoryContract.dart';

class GetSourcesByCategoryIdUseCase {
  SourcesRepositiryContract sourcesRepositiryContract;

  GetSourcesByCategoryIdUseCase(this.sourcesRepositiryContract);

  Future<List<Source>?> invoke(String categoryID) {
    return sourcesRepositiryContract.getSources(categoryID);
  }
}
