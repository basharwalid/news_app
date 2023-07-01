import 'package:flutter/material.dart';
import 'package:newsapp/home/homelayout.dart';

class splashScreen extends StatelessWidget {
  static const String routeName = 'Splash screen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),
            ()
    {
      Navigator.pushReplacementNamed(context, homelayout.routeName);
    });
    return Scaffold(
        body: Container(
      child: Image.asset("assets/images/splash.png"),
    ));
  }
}
