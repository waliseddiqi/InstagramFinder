import 'package:dio/dio.dart';
import 'package:instagramfinder/Services/requests.dart';
import 'package:instagramfinder/locator.dart';

abstract class ApiService {
  Future<Response> getInstagramUser(String userName);
}


class Api extends ApiService{
  
  @override
  Future<Response> getInstagramUser(String userName)async {
    GetRequest requests =  locator<GetRequest>();
   
    return await requests.callRequest("https://www.instagram.com/"+userName+"/channel/?__a=1");
   
  }

}