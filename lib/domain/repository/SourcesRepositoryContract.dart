import 'package:news_app/domain/model/Source.dart';

abstract class SourcesRepositiryContract {
  Future<List<Source>?> getSources(String categoryID);
}

abstract class SourcesDataSource {
  Future<List<Source>?> getSources(String CategoryId);
}
