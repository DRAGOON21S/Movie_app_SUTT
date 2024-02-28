import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_api_app/models/movie_image.dart';
import 'package:movie_api_app/models/movie_now_playing.dart';

var client = http.Client();

class Api{
  Future<List<Movie_now>> getnowplaying() async{
    final url =Uri.parse("https://movies-tv-shows-database.p.rapidapi.com?page=1");
    client.get(url);
    final headers = {
      'Type' : 'get-nowplaying-movies',
      'X-Rapidapi-Key': '69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576',
      'X-Rapidapi-Host': 'movies-tv-shows-database.p.rapidapi.com'
    };
    final response = await client.get(url, headers: headers);
    // print(response.body);
    if (response.statusCode == 200){
      final movienowlist = json.decode(response.body)['movie_results'] as List;

      print('hello2');
      return movienowlist.map((movie_now)=> Movie_now.fromJson(movie_now)).toList();
    }
    else {
      print("error");
      throw Exception('error');
    }

  }

  Future<String> getmovieimage(dynamic id) async{
    final url =Uri.parse("https://movies-tv-shows-database.p.rapidapi.com?movieid=$id");
    // print(id);
    final headers = {
      'Type' : 'get-movie-images-by-imdb',
      'X-Rapidapi-Key': '69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576',
      'X-Rapidapi-Host': 'movies-tv-shows-database.p.rapidapi.com'
    };
    // print("start");
    final response = await http.get(url, headers: headers);
    // print(response.headers);
    // print(response.body);
    // print(response);
    if (response.statusCode == 200){
      // print('qwerty');
      // final movieimagelist = json.decode(response.body) as List ;

      // print('hello3');
      // return movieimagelist.map((movie_image)=> Movie_image.fromJson(movie_image)).toList();
      return "http://image.tmdb.org/t/p/original/jDdnDEGu3GiLtJwDXeL4hfFzmGv.jpg";
    }
    else {
      print("error");
      throw Exception('error');
    }

  }
}