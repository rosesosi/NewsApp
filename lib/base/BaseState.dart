import 'package:flutter/material.dart';
import 'package:news_app/base/base_navigator.dart';
import 'package:news_app/base/base_viewModel.dart';
import 'package:news_app/utils/dialog_utils.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void showLoading(String message) {
    DialogUtils.showProgressDialog(context, message);
  }

  @override
  void hideLoading() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negActionTitle: negActionTitle,
        negAction: negAction,
        isDismissible: isDismissible);
  }
}
