

class Movie_now{
  String  title;
  String id;

  Movie_now({
    required this.title,
    required this.id,
});

  factory Movie_now.fromJson(Map<String, dynamic> json){
    return Movie_now(
      title : json["title"],
      id: json["imdb_id"],
    );
  }

}