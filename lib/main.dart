import 'package:flutter/material.dart';
import 'package:movie_api_app/homepage.dart';
import 'package:movie_api_app/splash.dart';

void main()=>runApp(MaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home:Splash()
  ));



