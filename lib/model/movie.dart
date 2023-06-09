class Movie {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  String error;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
  }) : error = '';

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie(
        backdropPath: '',
        id: 0,
        originalLanguage: '',
        originalTitle: '',
        overview: '',
        popularity: 0.0,
        posterPath: '',
        releaseDate: '',
        title: '',
        video: false,
        voteCount: 0,
        voteAverage: '',
      );
    }

    return Movie(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'].toString(),
    );
  }
}
