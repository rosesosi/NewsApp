import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/ui/category_grid_view_item.dart';
import 'package:news_app/view/settings/SettingScreen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  List<Category> categoryList = [
    Category(
        categoryId: "sports",
        categoryImage: "assets/images/ball.png",
        categoryTitle: "Sports",
        categoryBackgroundColor: const Color.fromARGB(255, 201, 28, 34)),
    Category(
        categoryId: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "Politics",
        categoryBackgroundColor: const Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryId: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "Health",
        categoryBackgroundColor: const Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryId: "business",
        categoryImage: "assets/images/bussines.png",
        categoryTitle: "Bussines",
        categoryBackgroundColor: const Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryId: "technology",
        categoryImage: "assets/images/environment.png",
        categoryTitle: "Technology",
        categoryBackgroundColor: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryId: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "science",
        categoryBackgroundColor: const Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.projectTitle),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: MyTheme.lightprimaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.projectTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.category,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SettingScreen.routeName);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.settings,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick your category \n of interest',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.grey, fontSize: 22),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 6 / 7),
                itemBuilder: (context, index) => CategoryGridViewItem(
                  index: index,
                  category: categoryList[index],
                ),
                itemCount: categoryList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
