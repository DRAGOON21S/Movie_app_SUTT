import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import './main.dart';
// import './homepage.dart';


class Splash_widget extends StatefulWidget {
  const Splash_widget({super.key});

  @override
  State<Splash_widget> createState() => _SplashState();
}
class _SplashState extends State<Splash_widget> {
@override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          Container(
            child: Text('Splash Screen', style: TextStyle(
                fontSize : 24,
                fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      );



  }
}
