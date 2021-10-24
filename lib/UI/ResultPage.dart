import 'package:flutter/material.dart';
import 'package:instagramfinder/DataModels/test.dart';
import 'package:instagramfinder/UI/components/UserDetailsPanel.dart';
import 'package:instagramfinder/UI/components/UserDetailsTopCutomClip.dart';
import 'package:instagramfinder/UI/components/UserPostItem.dart';
import 'package:instagramfinder/ViewModels/result_page_view_model.dart';
import 'package:stacked/stacked.dart';

class ResultPage extends StatelessWidget{
  final String userName;

  const ResultPage({Key? key,required this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return    ViewModelBuilder<ResultPageViewModel>.reactive(
      disposeViewModel: true,
      viewModelBuilder: () => ResultPageViewModel(userName: userName),
      onDispose: (ResultPageViewModel model){
        
        ////for disposing after viewmodel disposes
      },
      builder: (context, model, child) {
        User? user = model.data?.graphql?.user;
      return  model.hasError?Text("Error"):
       SafeArea(child: Scaffold(
         appBar: AppBar(
           ///checking if it is private account (for color of appBar)
           backgroundColor: (user?.isPrivate??true)?Theme.of(context).secondaryHeaderColor:Theme.of(context).primaryColor,
           shadowColor: Colors.transparent,),
        body: Center(
          child: model.isBusy?CircularProgressIndicator():
          Container(
            height: size.height,
            child: ListView(

              children: [
                ///profile photo
                /// 
                UserDetailsBar(
                  fullName: user?.fullName,
                  userName: user?.username,
                  followersCount: user?.edgeFollowedBy?.count,
                  followingCount: user?.edgeFollow?.count,
                  profileURL: user?.profilePicUrlHd,
                  biography: user?.biography,
                  isVerified: user?.isVerified,
                ),
                ////user posts
                Container(
                  child: Column(
                    children: [
                  Padding(
                    padding:  EdgeInsets.all(size.height/90),
                    child: Row(
                      children: [
                        Text("POSTS",style: TextStyle(fontSize: size.height/45,color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  ///check if the user photos
                       user?.edgeOwnerToTimelineMedia?.edges?.length==0?
                       Container(
                         margin: EdgeInsets.only(top: size.height/13),
                         child: Text((user?.isPrivate??false)?"Private Account":"No Posts",style: TextStyle(fontSize: size.height/35,color: Theme.of(context).secondaryHeaderColor),),):
                      Container(
                      
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:  new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 1,
                                    childAspectRatio: size.aspectRatio*1.2),
                          scrollDirection: Axis.vertical,
                         
                          itemCount: user?.edgeOwnerToTimelineMedia?.edges?.length??0,
                          itemBuilder: (context,index){
                           
                            String? postUrl = user?.edgeOwnerToTimelineMedia?.edges?[index].node?.displayUrl;
                            return UserPostItem(postUrl: postUrl,
                            likeCounts: user?.edgeOwnerToTimelineMedia?.edges?[index].node?.edgeLikedBy?.count??0,
                            );
                          }),
                      ),
                    ],
                  ),
                )
             
                
              ],
            ),
          )
        ),
      ));},
    );
  }

}