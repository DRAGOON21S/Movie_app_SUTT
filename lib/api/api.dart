import 'dart:convert';
import 'package:http/http.dart' as http;
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

    if (response.statusCode == 200){
      final movienowlist = json.decode(response.body)['movie_results'] as List;

      print(movienowlist);
      return movienowlist.map((movie_now)=> Movie_now.fromJson(movie_now)).toList();
    }
    else {
      print("error");
      throw Exception('error');
    }

  }
}