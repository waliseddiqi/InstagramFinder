import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramfinder/UI/components/UserDetailsTopCutomClip.dart';

class UserDetailsBar extends StatelessWidget{
  final String? profileURL;
  final String? userName;
  final String? fullName;
  final int? followersCount;
  final int? followingCount;
  final String? biography;
  final bool? isVerified;

  const UserDetailsBar({Key? key, this.profileURL, this.userName, this.fullName, this.followersCount, this.followingCount, this.biography, this.isVerified}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return    Stack(
      children: [
                    Container(
              height: size.height/3,
              child: Column(
    children: [
      ///Curved path on top
       ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: size.height/3.5,
            ///if the profile is private show less vibrant color
            color: Theme.of(context).primaryColor
          ),
          clipper: CustomClipPath()),
               

    ],
              ),
            ),
        Container(
        
          height: size.height/1.5,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           children: [
          
                     SizedBox(height: size.height/11,),

              Padding(
        padding:  EdgeInsets.all(size.height/90),
        child: Center(
          child: Container(
            height: size.aspectRatio*250,
            width: size.aspectRatio*250,
        
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(100)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(imageUrl: profileURL??"",
            placeholder: (_,__)=>Icon(Icons.image,color: Colors.white,size: size.height/20,)
            ),),
            
          ),
        ),
              ),
              ///Fullname
           Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(fullName??"",style: TextStyle(fontSize: size.height/35,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600)),
          ),
          //username
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(userName??"",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
          ),
          ///if the account is verified from instagram then show the verified icon next to user name
          Padding(padding: const EdgeInsets.all(4.0),
          child:(isVerified??false)?Icon(Icons.verified,size: size.height/45,color: Colors.blue,):SizedBox(),
          
          )
                 ],
               ),
               ///user's biography
            Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(biography??"",textAlign: TextAlign.center,style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
          ),
                     SizedBox(height: size.height/45,),
                     ///followers count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(padding: const EdgeInsets.all(4.0),
                    child: Text("FOLLOWERS",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
                  ),
                   Padding(padding: const EdgeInsets.all(4.0),
                    child: Text("$followersCount",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
                  ),
                ],
              ),
              ///following count
                    Column(
                children: [
                  Padding(padding: const EdgeInsets.all(4.0),
                    child: Text("FOLLOWING",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
                  ),
                   Padding(padding: const EdgeInsets.all(4.0),
                    child: Text("$followingCount",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).secondaryHeaderColor)),
                  ),
                ],
              ),
            ],
          )
              
            
   
        
             
             
       

           ],
             ),
        ),
      ],
    );
  }

}