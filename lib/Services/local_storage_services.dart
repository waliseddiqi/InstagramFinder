

import 'dart:collection';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  static late LocalStorageService _instance;
  static  SharedPreferences? _preferences;
  static Future<LocalStorageService> getInstance() async {
   
      _instance = LocalStorageService();

     
        _preferences = await SharedPreferences.getInstance();
    
    return _instance;
  }

static String historyListKey  = "historyListKey";
 




void saveStringItemToDisk(String key,String item){
  ///just simple way of saving data as key value using SharedPreferences 
  ///for more intense local storage we can use SQLITE or HIVE that I used before
  List<String>? _list =[];
  _list =  _preferences!.getStringList(key);
  if((_list?.length??0)==10){
    //no more than 10
    _list?.removeAt(_list.length-1);

  }
  DateTime time = DateTime.now();
  _list?.add(item+"t:"+"${time.year}/${time.month}/${time.day}   ${time.hour} : ${time.minute}");
  
  _preferences?.setStringList(key, _list??[]);

}



dynamic getFromDisk(String key){
  var value  = _preferences!.get(key);
  print('(LOG) LocalStorageService:_getFromDisk. key: $key value: $value');
  return value;
}
void saveStringToDisk(String key, String content){
  print('(LOG) LocalStorageService:_saveStringToDisk. key: $key value: $content');
  _preferences!.setString(key, content);
  // _preferences.setString(UserKey, content);
}


void saveBoolToDisk(String key, bool value){
  print('(LOG) LocalStorageService:_saveStringToDisk. key: $key value: $value');
  _preferences!.setBool(key, value);
  // _preferences.setString(UserKey, content);
}
void deletewithKey(String key){
  print('(LOG)LocalStorageService:deletewithKey. key:$key');
  _preferences!.remove(key);
}

void clearAll(){
  print('(LOG)LocalStorageService:clearAll');
  _preferences!.clear();
 // deleteSharedPreferences();
}
}