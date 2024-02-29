class Movie_data{

  dynamic  title;
  dynamic description;
  dynamic rating;
  dynamic tagline;
  dynamic year;
  dynamic rated;
  dynamic trailer;
  


  Movie_data({

    required this.title,
    required this.description,
    required this.rating,
    required this.tagline,
    required this.year,
    required this.rated,
    required this.trailer,
  });

  factory Movie_data.fromJson(Map<dynamic, dynamic> json){
    return Movie_data(

      title : json["title"],
      description: json["description"],
      rating: json["imdb_rating"],
      tagline: json["tagline"],
      year: json["year"],
      rated: json["rated"],
      trailer: json["youtube_trailer_key"],
    );
  }

}


// {
//     "title": "Inception",
//     "description": "Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person's idea into a target's subconscious.",
//     "tagline": "Your mind is the scene of the crime.",
//     "year": "2010",
//     "release_date": "2010-07-15",
//     "imdb_id": "tt1375666",
//     "imdb_rating": "8.367",
//     "vote_count": "35313",
//     "popularity": "116.615",
//     "youtube_trailer_key": "Jvurpf91omw",
//     "rated": "PG-13",
//     "runtime": 148,
//     "genres": [
//         "Action",
//         "Sci-Fi",
//         "Adventure",
//         "Crime",
//         "Mystery",
//         "Thriller"
//     ],
//     "stars": [
//         "Leonardo DiCaprio",
//         "Joseph Gordon-Levitt",
//         "Ken Watanabe",
//         "Tom Hardy",
//         "Elliot Page",
//         "Dileep Rao",
//         "Cillian Murphy",
//         "Tom Berenger",
//         "Marion Cotillard",
//         "Pete Postlethwaite",
//         "Michael Caine",
//         "Lukas Haas",
//         "Talulah Riley",
//         "Tohoru Masamune",
//         "Taylor Geare",
//         "Claire Geare",
//         "Johnathan Geare",
//         "Yuji Okumoto",
//         "Earl Cameron",
//         "Ryan Hayward",
//         "Miranda Nolan",
//         "Russ Fega",
//         "Tim Kelleher",
//         "Coralie Dedykere",
//         "Silvie Laguna",
//         "Virgile Bramly",
//         "Nicolas Clerc",
//         "Jean-Michel Dagory",
//         "Marc Raducci",
//         "Tai-Li Lee",
//         "Magnus Nolan",
//         "Helena Cullinan",
//         "Mark Fleischmann",
//         "Shelley Lang",
//         "Adam Cole",
//         "Jack Murray",
//         "Kraig Thornber",
//         "Angela Nathenson",
//         "Natasha Beaumont",
//         "Carl Gilliard",
//         "Jill Maddrell",
//         "Alex Lombard",
//         "Nicole Pulliam",
//         "Peter Basham",
//         "Michael Gaston",
//         "Felix Scott",
//         "Andrew Pleavin",
//         "Lisa Reynolds",
//         "Jason Tendell",
//         "Jack Gilroy",
//         "Shannon Welles",
//         "Daniel Girondeaud",
//         "Ellen Page",
//         "Michael August",
//         "Ken Bahn",
//         "Hélène Cardona",
//         "John Ceallach",
//         "Garvin Cross",
//         "Youlanda Davis",
//         "Julie Eagleton",
//         "Seve Esposito",
//         "Marcus Everett",
//         "Zachary Christopher Fay",
//         "Natalie Goldwin",
//         "Andrew Hoagland",
//         "Marguerite Gioia Insolia",
//         "Charles Jarrell",
//         "Seong-hwan Jo",
//         "Alonzo F. Jones",
//         "Mobin Khan",
//         "Shunsaku Kudô",
//         "Leticia LaBelle",
//         "John Lawson",
//         "Jean-Christophe Leger",
//         "François-Marie Nivon",
//         "Scott Pretty",
//         "Benjamin Riley",
//         "Norman Saleet",
//         "Colin Smith",
//         "Affan Tareen"
//     ],
//     "directors": [
//         "Paula Turnbull",
//         "Steve Gehrke",
//         "Christopher Nolan",
//         "Nilo Otero",
//         "Gregory J. Pawlik Jr.",
//         "Sarah Hood",
//         "Richard Graysmark",
//         "Brian Sepanzyk",
//         "Yann Mari Faget",
//         "Tarik Ait Ben Ali",
//         "Mohamed Essaghir Aabach",
//         "Brandon Lambdin",
//         "Lorie Gibson",
//         "William D. Robinson",
//         "Ahmed Hatimi",
//         "Jody Ryan",
//         "Tracey Poirier",
//         "Tetsuo Funabashi",
//         "Kevin Frilet",
//         "Gordon Piper",
//         "Mohammed Hamza Regragui"
//     ],
//     "countries": [
//         "United Kingdom",
//         "United States of America",
//         "USA, UK"
//     ],
//     "language": [
//         "English",
//         "Français",
//         "日本語",
//         "Kiswahili",
//         "en",
//         "English, Japanese, French"
//     ],
//     "status": "OK",
//     "status_message": "Query was successful"
// }