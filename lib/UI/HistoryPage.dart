import 'package:flutter/material.dart';
import 'package:instagramfinder/UI/HomePage.dart';
import 'package:instagramfinder/ViewModels/history_page_view_model.dart';
import 'package:stacked/stacked.dart';

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  ViewModelBuilder<HistoryPageViewModel>.reactive(
      disposeViewModel: true,
      viewModelBuilder: () => HistoryPageViewModel(),

      builder: (context, model, child)=>
       SafeArea(child: Scaffold(
         appBar: AppBar(

           title:Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                IconButton(onPressed: (){
                  model.removeAllList();
                  ///remove all saved history
                }, icon: Icon(Icons.delete))
             ],
           ) 
         ),
         body: Center(
           child:  
              ListView.builder(
               itemCount: model.getSavedList()?.length??0,
               itemBuilder: (context,index)=>savedItem(size,model.getSavedList()![index],context)),
           ),
         ),
      ),
    );
  }



  Widget savedItem(Size size,String savedString,BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
            color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),

        child: InkWell(
              borderRadius: BorderRadius.circular(15),

          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultPage(userName: savedString.split("t:")[0],)));
          },
          child: Container(
            height: size.height/15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading:   Text(savedString.split("t:")[0],style: TextStyle(fontSize: size.height/45,color: Theme.of(context).scaffoldBackgroundColor)),
          
              trailing:  Text(savedString.split("t:")[1],style: TextStyle(fontSize: size.height/45,color: Theme.of(context).scaffoldBackgroundColor)),

            
            ),
      
            
            ),
        ),
      ),
    );
  }


}



