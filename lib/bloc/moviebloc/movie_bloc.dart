import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile/bloc/moviebloc/movie_bloc_event.dart';
import 'package:flutter_profile/bloc/moviebloc/movie_bloc_state.dart';
import 'package:flutter_profile/model/movie.dart';
import 'package:flutter_profile/service/api_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStartedToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStartedToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getNowPlayingMovie();
      } else {
        movieList = await service.getMovieByGenre(movieId);
      }

      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      yield MovieError();
    }
  }
}
