import 'package:flutter/material.dart';
import 'package:instagramfinder/UI/HistoryPage.dart';
import 'package:instagramfinder/UI/HomePage.dart';
import 'package:instagramfinder/UI/components/instagramLogo.dart';
import 'package:instagramfinder/ViewModels/search_page_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchPage extends StatelessWidget{



  //validating form
  void isValidForm(SearchPageViewModel model,BuildContext context)async {
   
    
    if (model.formKey.currentState!.validate()) {
        model.formKey.currentState!.save();
        FocusScope.of(context).unfocus();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(userName: model.userInput,)));

      
    }}
     


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return 
      ///ViewModel builder
      ViewModelBuilder<SearchPageViewModel>.reactive(
      disposeViewModel: true,
      viewModelBuilder: () => SearchPageViewModel(),
      onDispose: (SearchPageViewModel model){
        model.searchInputController.dispose();
        
        ////for disposing after viewmodel disposes
      },
      builder: (context, model, child) =>
      SafeArea(
       
       child: Scaffold(
         appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                ///Navigation to History Page
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryPage()));
              }, icon: Icon(Icons.history))
            ],
          ),
         ),
         body: Center(
           child: SingleChildScrollView(
             
             child: Column(
               children: [
           
           
                 ///Top logo here
                 InstagramLogo(),
           
           
           
                ////Form starts here
                 Form(
                   key: model.formKey,
                   child: Padding(
                     padding: EdgeInsets.all(size.height/90),
                     child: TextFormField(
                            validator: model.inputValidator,
                            onSaved: (String? value)=>model.userInput=(value!.trim()),
                            decoration: InputDecoration(
                              labelText: "Type Your Username",
                               border: new OutlineInputBorder(
                                
                                borderSide: new BorderSide(color: Colors.teal)
                              ),
                            ),
                     ),
                     
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.all(size.height/90),

                   child: SizedBox(
                     width: size.width/1,
                     height: size.height/14,
                     child: ElevatedButton(onPressed: (){
                       isValidForm(model, context);
                     }, child: Text("Search",style: TextStyle(fontSize: size.height/55),)),
                   ),
                 )
               ],
             ),
           ),
         ),
       )),
   );
  }

}


