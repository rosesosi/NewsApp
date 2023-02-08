import 'dart:ui';

abstract class BaseNavigator {
  void showLoading(String message);

  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true});

  void hideLoading();

  void goToHomeScreen();
}
