import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'api/api.dart';
import 'models/movie_now_playing.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  late Future<List<Movie_now>> getnowplaying;
  @override
  void initState(){
    super.initState();
    getnowplaying = Api().getnowplaying();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:AppBar(

        title: Text("movie-app", textAlign:TextAlign.center),
        backgroundColor: Colors.grey[600],
      ),
      // home: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10,1,10,1),
                child:
                Text("Trending movies", style: TextStyle(fontSize: 24),),),
              SizedBox(
                // height : height,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 15,
                  options: CarouselOptions(
                    height: height*0.85 ,
                   // aspectRatio: 9/15 ,
                    autoPlay: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.easeInOutCubicEmphasized,
                    autoPlayAnimationDuration: Duration(seconds: 3),

                  ),
                  itemBuilder: (context,itemIndex, pageViewIndex){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0,5 , 0, 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Colors.grey[400],
                          // height: 100,
                          width: width,
                        ),
                      ),
                    );
                  }


                )
                ),

            ],
          ),
        )

    );
  }
}