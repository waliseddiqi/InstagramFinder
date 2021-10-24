
import 'package:flutter/material.dart';

import 'package:instagramfinder/UI/SearchPage.dart';
import 'package:instagramfinder/locator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
    @override
  void initState() {
    ////setting up get it locator for dependecies 
      setUpLocator();
  // getuser();
    super.initState();
  }

 
    ///for generating shades of our custom color and able to use it as primarycolor of the app
  Map<int, Color> color =
    {
    50:Color.fromRGBO(4,131,184, .1),
    100:Color.fromRGBO(4,131,184, .2),
    200:Color.fromRGBO(4,131,184, .3),
    300:Color.fromRGBO(4,131,184, .4),
    400:Color.fromRGBO(4,131,184, .5),
    500:Color.fromRGBO(4,131,184, .6),
    600:Color.fromRGBO(4,131,184, .7),
    700:Color.fromRGBO(4,131,184, .8),
    800:Color.fromRGBO(4,131,184, .9),
    900:Color.fromRGBO(4,131,184, 1),
    };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Finer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: MaterialColor(0xFF5E69EE, color),
        scaffoldBackgroundColor: Color(0xFFF4F4FB),
        secondaryHeaderColor: Color(0xFF8CB1F3)
      ),
      home: SearchPage(),
    );
  }
}
