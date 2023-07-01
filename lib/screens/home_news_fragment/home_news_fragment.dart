import 'package:flutter/material.dart';
import 'package:newsapp/api/apiManager.dart';

import '../articles/articlesScreen.dart';
class HomeNewsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getNewsSources(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(onPressed: (){}, child: Text("Try Again"))
                ],
              ),
            );
          }
          var response = snapshot.data;
          if(response?.status == "error"){
            return Center(
              child: Column(
                children: [
                  Text(response?.message??""),
                  ElevatedButton(onPressed: (){}, child: Text("Try Again"))
                ],
              ),
            );
          }
          return articlesScreen(response?.sources);
        },
    );
  }
}
