import 'package:flutter/material.dart';
import 'package:newsapp/Theme/Mytheme.dart';
import 'package:newsapp/home/homelayout.dart';
import 'package:newsapp/ui/searchScreen/SearchScreen.dart';
import 'package:newsapp/ui/splash/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          splashScreen.routeName:(_) => splashScreen(),
          homelayout.routeName:(_) =>  homelayout(),
          SearchScreen.routeName :(_) => SearchScreen()
        },
      initialRoute: splashScreen.routeName,
      theme: Mytheme().themeData,
    );
  }
}
