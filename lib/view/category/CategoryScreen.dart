import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/category.dart';
import 'package:news_app/utils/dialog_utils.dart';
import 'package:news_app/view/category/CategoryTabWidget.dart';
import 'package:news_app/view/category/CategoryViewModel.dart';
import 'package:news_app/view/searchPage.dart';
// import 'package:http/http.dart' as http;

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'NewsDetailsScreen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Category args =
          ModalRoute.of(context)?.settings.arguments as Category;
      viewModel.loadSources(args.categoryId);
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    final Category args =
        ModalRoute.of(context)?.settings.arguments as Category;

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
          child: BlocProvider<CategoryViewModel>(
            create: (_) => viewModel,
            child: BlocConsumer<CategoryViewModel, CategoryWidgetState>(
              listener: (context, state) {
                if (state is MessageState) {
                  DialogUtils.showMessage(context, state.message);
                }
              },
              listenWhen: (prevState, newState) {
                if (newState is MessageState) return true;
                return false;
              },
              buildWhen: (prevState, newstate) {
                if (newstate is MessageState) return false;
                return true;
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SourcesLoadingState) {
                  return CategoryTabsWidget(state.sources!);
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(state.errorMessage!),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.loadSources(args.categoryId);
                          },
                          child: const Text('Try Again'),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
          // ChangeNotifierProvider<CategoryNewsListViewModel>(
          //   create: (_) => viewModel,
          //   child: Consumer<CategoryNewsListViewModel>(
          //     builder: (buildContext, viewModel, __) {
          //       if (viewModel.errorMessage != null) {
          //         return Center(
          //           child: Column(
          //             children: [
          //               Text(viewModel.errorMessage!),
          //               ElevatedButton(
          //                 onPressed: () {
          //                   viewModel.loadNewsSources(args.categoryId);
          //                 },
          //                 child: const Text('Try Again'),
          //               )
          //             ],
          //           ),
          //         );
          //       } else if (viewModel.sources == null) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         return CategoryTabsWidget(viewModel.sources!);
          //       }
          //     },
          //   ),
          //   // child: FutureBuilder<SourcesResponsee>(
          //   //   future: ApiManager.getSources(args.categoryId),
          //   //   builder: (buildContext, snapshot) {
          //   //     if (snapshot.connectionState == ConnectionState.waiting) {
          //   //       return Center(
          //   //         child: CircularProgressIndicator(),
          //   //       );
          //   //     }
          //   //     if (snapshot.hasError) {
          //   //       return Center(
          //   //         child: Text('Error Loading data ${snapshot.error.toString()}'),
          //   //       );
          //   //     }
          //   //     if (snapshot.data?.status == 'error') {
          //   //       return Center(
          //   //         child: Text('Server error ${snapshot.data?.message}'),
          //   //       );
          //   //     }
          //   //     var sources = snapshot.data?.sources;
          //   //     return CategoryTabsWidget(sources!);
          //   //   },
          //   // ),
          // ),
          ),
    );
  }
}
// @override
// void goToHomeScreen() {
//   // TODO: implement goToHomeScreen
// }
//
// @override
// CategoryNewsListViewModel initViewModel() {
//   return CategoryNewsListViewModel();
// }
//}
