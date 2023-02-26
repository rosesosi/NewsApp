import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/repository/SourcesRepositoryContract.dart';
import 'package:news_app/model/Source.dart';

class CategoryViewModel extends Cubit<CategoryWidgetState> {
  SourcesRepositiryContract repositiry;

  CategoryViewModel(this.repositiry) : super(LoadingState());

  void loadSources(String categoryID) async {
    try {
      var response = await repositiry.getSources(categoryID);
      // var response = await ApiManager.getSources(categoryID);

      if (response == null) {
        emit(ErrorState("Error loading NewsResourcs"));
      }
      //if (response.status == 'error') {
      //  emit(ErrorState(response.message!));
      // }
      else {
        emit(SourcesLoadingState(response));
        // emit(SourcesLoadingState(response.sources!));
        emit(MessageState("sources load sucssesfuly"));
      }
    } catch (e) {
      emit(ErrorState("Error loading NewsResourcs"));
    }
  }
}

abstract class CategoryWidgetState {}

class LoadingState extends CategoryWidgetState {}

class ErrorState extends CategoryWidgetState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SourcesLoadingState extends CategoryWidgetState {
  List<Source> sources;

  SourcesLoadingState(this.sources);
}

class MessageState extends CategoryWidgetState {
  String message;

  MessageState(this.message);
}

// lw ha3ml navigate mn view model
class NavigateToScreenState extends CategoryWidgetState {
  String routeName;

  NavigateToScreenState(this.routeName);
}
