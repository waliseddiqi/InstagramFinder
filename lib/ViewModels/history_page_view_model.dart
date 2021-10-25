import 'package:instagramfinder/Services/local_storage_services.dart';
import 'package:instagramfinder/ViewModels/home_page_view_model.dart';
import 'package:instagramfinder/locator.dart';
import 'package:stacked/stacked.dart';

class HistoryPageViewModel extends BaseViewModel{
 

List<dynamic>? getSavedList(){

  LocalStorageService localStorageService = locator<LocalStorageService>();

  return  localStorageService.getFromDisk(LocalStorageService.historyListKey);

}



}