import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_api_app/models/movie_data.dart';
import 'package:movie_api_app/models/movie_image.dart';
import 'package:movie_api_app/models/movie_now_playing.dart';
import 'package:dio/dio.dart';

var client = http.Client();

class Api2{
  Future<Movie_data> getmoviedetail(String id) async {
    final headers = {
      'Type' : 'get-movie-details',
      'X-Rapidapi-Key': '9c62f05fa8msh1746e484bbd49c6p1b0f4ejsne6e4c3ea2103',
      'X-Rapidapi-Host': 'movies-tv-shows-database.p.rapidapi.com'
    };
    var dio = Dio();
    try {
    final response1 = await dio.get('https://movies-tv-shows-database.p.rapidapi.com?movieid=$id' , options: Options(headers: headers));
    // print(response1.data);
    final responseData = response1.data;
    final model = Movie_data.fromJson(responseData as Map<String, dynamic>);
    if (response1.statusCode == 200){
      return model;
    }
    else {
      print("error");
      throw Exception('error');
    }
  }
  on DioException catch (e) {
    print(e.message);
    throw Exception(e.message);
  }
  }
  

}