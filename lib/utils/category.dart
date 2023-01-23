import 'dart:ui';

class Category {
  String categoryId;

  String categoryImage;
  String categoryTitle;
  Color? categoryBackgroundColor;

  Category(
      {required this.categoryId,
      required this.categoryImage,
      required this.categoryTitle,
      this.categoryBackgroundColor});
}
