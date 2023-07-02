
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/apiManager.dart';

import '../../api/model/sources_response/Source.dart';

class NewsFragmentViewModel extends Cubit<NewsFragmentState>{
  NewsFragmentViewModel():super(LoadingState());//loading state is the initial state
  void LoadNewsSource(String catid)async{
    try{
      var response = await apiManager.getNewsSources(catid);
      if(response.status=="error"){
        emit(ErrorState(ErrorMessage: response.message));
        return;
      }
      if(response.status=="ok"){
        emit(SuccessState(response.sources!));
        return;
      }
    }
    on TimeoutException catch(e){
        //you don't have error message
      emit(ErrorState(ErrorMessage: "Couldn't reach server "));
    }
    catch(e){
        // you have error message
        emit(ErrorState(ErrorMessage: "Something went wrong "));
    }

  }
}

abstract class NewsFragmentState{}
// error , success , loading
 class LoadingState extends NewsFragmentState{
  String? LoadingMessage;
  LoadingState({this.LoadingMessage});
 }
 class ErrorState extends NewsFragmentState{
    String? ErrorMessage;
    Exception? exception;
    ErrorState({this.exception , this.ErrorMessage});
}
 class SuccessState extends NewsFragmentState{
    List<Source> source;
    SuccessState(this.source);
 }