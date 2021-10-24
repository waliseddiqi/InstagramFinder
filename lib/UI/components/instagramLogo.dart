import 'package:flutter/material.dart';

class InstagramLogo extends StatefulWidget{
  @override
  _InstagramLogoState createState() => _InstagramLogoState();
}

class _InstagramLogoState extends State<InstagramLogo> with SingleTickerProviderStateMixin{


  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    animationController.repeat(reverse: true);
    animation = Tween(begin: 0.1, end: 1.0).animate(animationController)..addListener(() {
        setState(() {
          
        });
    });
    
    super.initState();
  }


@override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }











  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

   return Container(
     margin: EdgeInsets.all(size.height/45),
     child: Center(
       child: Padding(
        padding: EdgeInsets.all(size.height/90),

         child: Container(

          height: size.aspectRatio*550,
                width: size.aspectRatio*550,
           decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: RadialGradient(
                    center: Alignment(animation.value,animation.value),
                    focal: Alignment( 0.3,animation.value),
                    focalRadius: 1.5,
                    colors: [Colors.purple,Colors.deepPurple, Colors.purple])
            ),
           
            child: Center(
              child: Container(
                height: size.aspectRatio*500,
                width: size.aspectRatio*500,
                    decoration: BoxDecoration( 
                      
               borderRadius: BorderRadius.circular(50),
               border: Border.all(width: 20,
                          color: Colors.white.withOpacity(0.7),
               
               )

           ),
           ///outer most rounded corner rectangle
           child: Center(
             child: SizedBox(
                height: size.aspectRatio*400,
                width: size.aspectRatio*400,
               child: Center(
                 child: Stack(

                   alignment: Alignment.topRight,
                   children: [
                     //inner circle

                     Container(
                          height: size.aspectRatio*260,
                    width: size.aspectRatio*260,
                        decoration: BoxDecoration( 
                          
                   borderRadius: BorderRadius.circular(100),
                   border: Border.all(width: 20,color: Colors.white.withOpacity(0.7),
)

           ),
                     ),
                     ///middle dot
                       Container(
                         
                          height: size.aspectRatio*40,
                    width: size.aspectRatio*40,
                        decoration: BoxDecoration( 
                          color: Colors.white.withOpacity(0.7),
                   borderRadius: BorderRadius.circular(100),
                 

           ),
                     )
                   ],
                 ),
               ),
             ),
           ),
              ),
            ),
         ),
       ),
     ),
   );

  }
}