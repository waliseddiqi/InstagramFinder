import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:instagramfinder/DataModels/test.dart';
import 'package:instagramfinder/Services/api_service.dart';
import 'package:instagramfinder/Services/local_storage_services.dart';
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
    
      
    
    
    ApiService apiService= new Api();
    
    Response response =  await apiService.getInstagramUser(userName);
   
    InstaUser res =  InstaUser.fromJson(response.data);
    LocalStorageService localStorageService = locator<LocalStorageService>();
    localStorageService.saveStringItemToDisk(LocalStorageService.historyListKey, userName);
    return res;
 
 
 
  
    }


    
  

  @override
  void onError(error) {
   print(error.runtimeType.toString());
    super.onError(error);
  }
}