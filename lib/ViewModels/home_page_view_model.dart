import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:instagramfinder/DataModels/UserModel.dart';

import 'package:instagramfinder/Services/api_service.dart';
import 'package:instagramfinder/Services/local_storage_services.dart';
import 'package:instagramfinder/Services/requests.dart';
import 'package:instagramfinder/locator.dart';
import 'package:stacked/stacked.dart';

class ResultPageViewModel extends FutureViewModel<InstaUser>{
  final String userName;

  ResultPageViewModel({required this.userName});

  ////our api call 
  @override
  Future<InstaUser> futureToRun() {
    return getuser();
  }

 Future<InstaUser> getuser()async{
    GetRequest requests =  locator<GetRequest>();
   
    ApiService apiService= new Api(requests);
  
    Response response =  await apiService.getInstagramUser(userName);
   
    InstaUser res =  InstaUser.fromJson(response.data);
    LocalStorageService localStorageService = locator<LocalStorageService>();
    localStorageService.saveStringItemToDisk(LocalStorageService.historyListKey, userName);
    return res;
    }


  String formatFollowersAndLikes(int count){
    if(count>5000&&count<1000000){
      return "${(count/1000).toStringAsFixed(1)}K";
    }else if(count>=1000000){
      return "${(count/1000000).toStringAsFixed(1)}M";
    }else{
      return count.toString();
    }
  }
    
  

  @override
  void onError(error)async {
   ////for handling API calls error
    super.onError(error);
  }
}