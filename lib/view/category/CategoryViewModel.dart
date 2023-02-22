import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/utils/Source.dart';

class CategoryViewModel extends Cubit<CategoryWidgetState> {
  CategoryViewModel() : super(LoadingState());

  void loadSources(String categoryID) async {
    try {
      var response = await ApiManager.getSources(categoryID);
      if (response.status == 'error') {
        emit(ErrorState(response.message!));
      } else {
        emit(SourcesLoadingState(response.sources!));
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
