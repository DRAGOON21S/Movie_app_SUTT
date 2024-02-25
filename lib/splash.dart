import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main.dart';
import './homepage.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
@override
void initState(){
  super.initState();
  _navigate();
}

_navigate()async{
await Future.delayed(Duration(milliseconds: 1500),(){});
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainApp()));

}


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
