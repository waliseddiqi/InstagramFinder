
import 'package:flutter/cupertino.dart';

import 'package:stacked/stacked.dart';

class SearchPageViewModel extends BaseViewModel{

late String userInput;

TextEditingController searchInputController = new TextEditingController();
 GlobalKey<FormState> formKey = GlobalKey<FormState>();






  String? inputValidator(String? value){
     if (value == null || value.isEmpty) return 'Please write a user name';
    return null;
  }




  


}