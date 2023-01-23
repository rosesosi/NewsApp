import 'package:flutter/material.dart';
import 'package:news_app/utils/Source.dart';
import 'package:news_app/view/category/SourceTabItem.dart';
import 'package:news_app/view/news/newsList.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((item) => SourceTab(
                      item, widget.sources.indexOf(item) == selectedIndex))
                  .toList(),
            ),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}
