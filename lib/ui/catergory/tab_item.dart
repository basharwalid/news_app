import 'package:flutter/material.dart';
import 'package:newsapp/api/model/sources_response/Source.dart';

class TabItem extends StatelessWidget {
  bool Selected;
  Source? source;
  TabItem(this.Selected , this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Selected?Theme.of(context).primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2)
      ),
      child: Text(source?.name ??"" ,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Selected?Colors.white:Theme.of(context).primaryColor
        )
      ),
    );
  }
}
