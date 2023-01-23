import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/Source.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceTab(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
