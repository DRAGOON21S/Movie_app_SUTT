import 'package:flutter/material.dart';
import 'package:movie_api_app/homepage.dart';
import 'package:movie_api_app/models/movie_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie_detail extends StatefulWidget {
  final String id;

  Movie_detail(this.id);

  @override
  State<Movie_detail> createState() => _Movie_detailState();
}

class _Movie_detailState extends State<Movie_detail> {
  Future<Movie_data> getmoviedetail(String id) async {
    final url =Uri.parse("https://movies-tv-shows-database.p.rapidapi.com?movieid=$id");
    print(id);
    final headers = {
      'Type' : 'get-movie-details',
      'X-Rapidapi-Key': '69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576',
      'X-Rapidapi-Host': 'movies-tv-shows-database.p.rapidapi.com'
    };
    print("start");
    final response = await http.get(url, headers: headers);
    print(response.body);
    
    if (response.statusCode == 200){
      print('qwerty');
      final moviedetail = json.decode(response.body) ;
      print('hello4');
      return moviedetail.map((moviedetail)=> Movie_data.fromJson(moviedetail));
    }
    else {
      print("error");
      throw Exception('error');
    }
  }

  late Future<Movie_data> getdetail;
  @override
  void initState(){
    getdetail= getmoviedetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movie_details',
      home: Scaffold(
        appBar: AppBar(
          title: Text('movie_details'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getmoviedetail(widget.id),
            builder:(context, snapshot3) {
              if (snapshot3.connectionState == ConnectionState.done && snapshot3.hasData) {
                                    return Text(snapshot3.data!.title);
                                        
                                    
                                  } else {
                                    return Center(
                                        child: Column(
                                          children: [
                                            CircularProgressIndicator(),
                                            MaterialButton(
                                              onPressed:()async{ Navigator.push(context, MaterialPageRoute(builder: (context)=>MainApp()));
                                              },
                                              child: Text('Go back to home page'),
                                            ),
                                          ],
                                        ),

                                      );
                                          
                                  }
            },
          )
        ),
      ),
    );
  }
}