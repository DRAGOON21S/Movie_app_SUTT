import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_api_app/movie_detail.dart';
import 'api/api.dart';
import 'models/movie_now_playing.dart';
import 'widgets/Splash_widget.dart';

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
    Future.delayed(Duration.zero, () async {
    await getnowplaying;
    // await Api().getmovieimage('tt11097384');
    
  });
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Movie_now>>(
      future: getnowplaying,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash_widget(); // Display a loading indicator while waiting for the Future to complete
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Display an error message if the Future fails
        } else {

        

          return Scaffold(
              appBar:AppBar(

                title: Text("movie-app", textAlign:TextAlign.center),
                backgroundColor: Colors.red[800],
              ),

              body: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Row(
                    //   children: [
                    //     SizedBox(height: 10),
                    //       TextField(
                    //       controller: _controller,
                    //       decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Search movie by name',
                    //       ),),
                    //     MaterialButton(
                    //       onPressed: () {
                    //         print(_controller.text);
                    //       },
                    //       child: Text('Search'),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10,1,10,1),
                      child:
                      Text("Playing Now", style: TextStyle(fontSize: 24),),),

                    SizedBox(
                      // height : height,
                        width: double.infinity,
                        child: CarouselSlider.builder(
                            itemCount: 20,
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
                              return FutureBuilder(
                                future: Api().getmovieimage(snapshot.data![itemIndex].id),
                                builder: (context, snapshot2) {
                                  if (snapshot.connectionState == ConnectionState.done && snapshot2.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: MaterialButton(
                                        onPressed: () async {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Movie_detail(snapshot.data![itemIndex].id)));
                                        },
                                        child:SizedBox(
                                          width: width,
                                          child: Image.network(
                                            snapshot2.data!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                            return Image.asset('assets/images/404_not_found.png', fit: BoxFit.cover);},
                                          ),
                                        ),
                                      ),),
                                    );
                                  } 
                                  else if (snapshot2.connectionState == ConnectionState.waiting) {
                                    return Splash_widget();}
                                  else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              );
                            }


                        )
                    ),

                  ],
                ),
              )

          );
        }
            },
          );
        }
      }
    

//   @override
//   Widget build(BuildContext context) {
//     dynamic height = MediaQuery.of(context).size.height;
//     dynamic width = MediaQuery.of(context).size.width;
//
//
// }