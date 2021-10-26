import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:instagramfinder/Helpers/api_exception_handler.dart';
import 'package:instagramfinder/Helpers/custom_exceptions.dart';

abstract class Request{
  final int? cacheLifeTime;

  Request({this.cacheLifeTime});
  Future<Response> callRequest(String url);
}

///for now we can have caching as default in our implementation
class GetRequest extends Request{


  @override
  Future<Response> callRequest(String url) async{
     Dio dio  = Dio();
     DioCacheManager _dioCacheManager;
     _dioCacheManager = DioCacheManager(CacheConfig());
      ///default cacheLifeTime is 1
      ///for testing having cache for 1 day is really long so we can implement it as seconds
     Options _cacheOptions = buildCacheOptions(Duration(days: cacheLifeTime!=null?0:1,seconds: cacheLifeTime??0),options: Options(      headers: {
        "Content-Type": "application/json", 
      },

      ));
   
   
    dio.interceptors.add(_dioCacheManager.interceptor);
   
   try {
    var response = await dio.get(url, options: _cacheOptions);
     return await ApiHandler.handle(response);
     
   } catch (e) {
     throw e;
   }
    
    

  

 
  }



}


// /non cachable maybe can be usable in testing
// /or we can have mock request that instead of calling dio we can have some data for testing (not calling instagram api)
class NonCachableRequest extends Request {
  @override
  Future<Response> callRequest(String url)async {
     Dio dio  = Dio();
   
   
    var response = await dio.get(url, options: Options(headers: {
        "Content-Type": "application/json", 
    }));
    ///handling response 
   // response = await ApiHandler.handle(response);
    return response;
  }

}