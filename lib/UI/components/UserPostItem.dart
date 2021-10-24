import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramfinder/UI/components/PostImageHero.dart';

class UserPostItem extends StatelessWidget{
  final String? postUrl;
  final String? caption;
  final int? likeCounts;
  const UserPostItem({Key? key, this.postUrl, this.caption, this.likeCounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(
          opaque: false,
          pageBuilder: (context,_,__)=>PostImageHero(postUrl: postUrl,)));
        //showDialog(context: context, builder: (BuildContext context){return PostImageHero(postUrl: postUrl,); });
      },
      child: Column(
        children: [
          Hero(
            tag: postUrl??"",
            child: Padding(
              padding:  EdgeInsets.all(size.height/90),
              child: Container(
                decoration: BoxDecoration(
                  
                ),
                child: ClipRRect(
                   borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(imageUrl: postUrl??"",placeholder: (__,_)=>Icon(Icons.image,color: Colors.white,size: size.height/20,),fit: BoxFit.fitHeight,
                  
                  ),
                ),
                height: size.aspectRatio*500,
                width: size.aspectRatio*350,
              
              ),
            ),
          ),
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Theme.of(context).secondaryHeaderColor
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite,size: size.height/30,color: Theme.of(context).scaffoldBackgroundColor,),
                        ),
                        Padding(padding: const EdgeInsets.all(1.0),
                        child: Text("$likeCounts",style: TextStyle(fontSize: size.height/55,color: Theme.of(context).scaffoldBackgroundColor),),
                        )
                ],
              ),
                     ),
                   ),
                 ),
        ],
      ),
    );
  }


}