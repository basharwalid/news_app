import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/apiManager.dart';

import '../../api/model/sources_response/News.dart';

class NewsListViewModel extends Cubit<NewsListViewState>{
  NewsListViewModel():super(LoadingState(loadingmessge: "Loading..."));
  void loadNews(String sourceId)async{
    var response = await apiManager.getNews(sourceId);
    try {
      if(response.status == 'error'){
        emit(ErrorState(errormessage: response.message));
        return;
      }
      if(response.status == 'ok'){
        emit(SuccessState(response.newsList!));
        return;
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(errormessage: "can't reach server \n please try again"));
    }on Exception catch(e){
        emit(ErrorState(errormessage: "something went wrong please try again"));
    }
  }
}

abstract class NewsListViewState{}

class LoadingState extends NewsListViewState{
  String? loadingmessge;
  LoadingState({this.loadingmessge});
}
class ErrorState extends NewsListViewState{
  String? errormessage;
  Exception? exception;
  ErrorState({this.exception, this.errormessage});
}

class SuccessState extends NewsListViewState{
  List<News>newslist;
  SuccessState(this.newslist);
}