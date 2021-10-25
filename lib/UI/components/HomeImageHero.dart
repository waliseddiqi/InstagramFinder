import 'package:flutter/material.dart';

class PostImageHero extends StatelessWidget{
  final String? postUrl;

  const PostImageHero({Key? key, this.postUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
    child: Container(
      height: size.height,
      width: size.width,
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width/1.05,
              child: Hero(
                    tag: postUrl??"",
                    child: Padding(
                      padding:  EdgeInsets.all(size.height/45),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage(postUrl??"",),fit: BoxFit.fitHeight)
                        ),
                        height: size.height/1.7,
                        width: size.aspectRatio*400,
                      
                      ),
                    ),
                  
                ),
                
            ),
               
          ],
        ),
      ),
    ),
  );
  }

}