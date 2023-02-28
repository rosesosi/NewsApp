import 'package:news_app/data/repository/NewsRepoImp.dart';
import 'package:news_app/data/repository/SourcesRepoImp.dart';
import 'package:news_app/domain/usecases/GetNewsBySourceIDUseCase.dart';
import 'package:news_app/domain/usecases/GetSourceByCategoryIDUseCase.dart';

GetNewsBySourceIDUseCase injectGetNewsBYSourceID() {
  return GetNewsBySourceIDUseCase(injectNewsRepository());
}

GetSourcesByCategoryIdUseCase injectGetSource() {
  return GetSourcesByCategoryIdUseCase(injectSourceRepo());
}
