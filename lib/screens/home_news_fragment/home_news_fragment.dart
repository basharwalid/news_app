import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Model/category.dart';
import 'package:newsapp/api/apiManager.dart';
import 'package:newsapp/api/model/sources_response/Source.dart';

import '../articles/articlesScreen.dart';
import 'news_fragment_viewmodel.dart';

class HomeNewsFragment extends StatelessWidget {
  Source? source;
  categoryModel category;
  var viewModel = NewsFragmentViewModel();
  HomeNewsFragment(this.category);
  @override
  Widget build(BuildContext context) {
    viewModel.LoadNewsSource(category.categoryid);
    return BlocBuilder<NewsFragmentViewModel, NewsFragmentState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return  Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10,),
                Text(state.LoadingMessage??"")
              ],
            ),
          );
          //show Loading
        } else if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.ErrorMessage??""),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            ),
          );
          //show error message
        } else if (state is SuccessState) {
          return articlesScreen(state.source);
        }
        return Container(); // unreachable
      },
    );

    // return FutureBuilder(
    //     future: apiManager.getNewsSources(source?.id??""),
    //     builder:(context, snapshot) {
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return const Center(child: CircularProgressIndicator(),);
    //       }
    //       if(snapshot.hasError){
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snapshot.error.toString()),
    //               ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
    //             ],
    //           ),
    //         );
    //       }
    //
    //       if(snapshot.data!.status == "error"){
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snapshot.data!.message??""),
    //               ElevatedButton(onPressed: (){}, child: const Text("Try Again"))
    //             ],
    //           ),
    //         );
    //       }
    //       var response = snapshot.data;
    //       return articlesScreen(response?.sources);
    //     },
    // );
  }
}
