import 'package:flutter/material.dart';
import 'package:news_app/utils/category.dart';
import 'package:news_app/view/news_details_screen.dart';

class CategoryGridViewItem extends StatelessWidget {
  Category category;
  int index;

  CategoryGridViewItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            arguments: category);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: category.categoryBackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
              bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.categoryImage),
            Text(
              category.categoryTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
