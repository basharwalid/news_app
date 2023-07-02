import 'package:flutter/material.dart';
import 'package:newsapp/screens/articles/News_list.dart';
import 'package:newsapp/ui/catergory/article_item.dart';
import 'package:newsapp/ui/catergory/tab_item.dart';

import '../../api/model/sources_response/Source.dart';

class articlesScreen extends StatefulWidget {
  List<Source>? sources;
  articlesScreen(this.sources);
  @override
  State<articlesScreen> createState() => _articlesScreenState();
}

class _articlesScreenState extends State<articlesScreen> {
  int SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length??0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  SelectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources?.map((source) => TabItem(
                        SelectedIndex == widget.sources?.indexOf(source), source))
                    .toList()?? []
    ),
            const SizedBox(height: 10),
            Expanded(child: NewsList(widget.sources![SelectedIndex]))
          ],
        ),
      ),
    );
  }
}
