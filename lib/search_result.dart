import 'package:flutter/material.dart';
import 'package:movie_api_app/models/movie_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Searchresult extends StatefulWidget {
  const Searchresult({super.key});

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
 
  
Future<List<Movie_data>> getmoviedetail(String name) async {
    final url =Uri.parse("https://movies-tv-shows-database.p.rapidapi.com?movie=$name");
    print(name);
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
      final moviedetail = json.decode(response.body) as List ;
      print('hello4');
      return moviedetail.map((moviedetail)=> Movie_data.fromJson(moviedetail)).toList();
    }
    else {
      print("error");
      throw Exception('error');
    }
  }





  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}