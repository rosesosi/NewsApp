import 'package:flutter/material.dart';
import 'package:news_app/base/BaseState.dart';
import 'package:news_app/utils/category.dart';
import 'package:news_app/view/category/CategoryTabWidget.dart';
import 'package:news_app/view/category/news_details_ViewModel.dart';
import 'package:news_app/view/searchPage.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

class NewsDetailsScreen extends StatefulWidget {
  static const String routeName = 'NewsDetailsScreen';

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState
    extends BaseState<NewsDetailsScreen, CategoryNewsListViewModel>
    implements NewsNavigator {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   viewModel.loadNewsSources()
  // }
  @override
  Widget build(BuildContext context) {
    final Category args =
        ModalRoute.of(context)?.settings.arguments as Category;

    viewModel.loadNewsSources(args.categoryId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(args.categoryTitle),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: ChangeNotifierProvider<CategoryNewsListViewModel>(
          create: (_) => viewModel,
          child: Consumer<CategoryNewsListViewModel>(
            builder: (buildContext, viewModel, __) {
              if (viewModel.errorMessage != null) {
                return Center(
                  child: Column(
                    children: [
                      Text(viewModel.errorMessage!),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Try Again'),
                      )
                    ],
                  ),
                );
              } else if (viewModel.sources == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CategoryTabsWidget(viewModel.sources!);
              }
            },
          ),
          // child: FutureBuilder<SourcesResponsee>(
          //   future: ApiManager.getSources(args.categoryId),
          //   builder: (buildContext, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error Loading data ${snapshot.error.toString()}'),
          //       );
          //     }
          //     if (snapshot.data?.status == 'error') {
          //       return Center(
          //         child: Text('Server error ${snapshot.data?.message}'),
          //       );
          //     }
          //     var sources = snapshot.data?.sources;
          //     return CategoryTabsWidget(sources!);
          //   },
          // ),
        ),
      ),
    );
  }

  @override
  void goToHomeScreen() {
    // TODO: implement goToHomeScreen
  }

  @override
  CategoryNewsListViewModel initViewModel() {
    return CategoryNewsListViewModel();
  }
}
