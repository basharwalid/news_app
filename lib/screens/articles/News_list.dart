import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/model/sources_response/NewsResponse.dart';
import 'package:newsapp/api/model/sources_response/Source.dart';
import 'package:newsapp/api/apiManager.dart';
import 'package:newsapp/screens/articles/news_list_viewModel.dart';

import '../../News/news_item.dart';

class NewsList extends StatelessWidget {
  Source? source;
  NewsList(this.source);
  NewsListViewModel viewModel = NewsListViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.loadNews(source?.id??"");
    return BlocBuilder<NewsListViewModel, NewsListViewState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errormessage ?? ""),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            ),
          );
        }if(state is SuccessState){
          var newsList = state.newslist;
              return ListView.builder(itemBuilder: (_, index) {
                return NewsItem(newsList[index]);
              },
                itemCount: newsList.length,
              );
        }
        return Container();
      },
    );
    // return FutureBuilder<NewsResponse>(
    //   future: apiManager.getNews(source.id??""),
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return const Center(child: CircularProgressIndicator(),);
    //     }
    //     if(snapshot.hasError){
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
    //           ],
    //         ),
    //       );
    //     }
    //
    //     if(snapshot.data!.status == "error"){
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data!.message??""),
    //             ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.newsList;
    //     return ListView.builder(itemBuilder: (_, index) {
    //       return NewsItem(newsList![index]);
    //     },
    //       itemCount: newsList?.length??0,
    //     );
    //   },
    // );
  }
}
