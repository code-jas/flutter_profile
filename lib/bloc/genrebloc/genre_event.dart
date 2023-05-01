import 'package:equatable/equatable.dart';

abstract class GenreEvent extends Equatable {
  const GenreEvent();
}

class GenreEventStarted extends GenreEvent {
  final int movieId;
  final String query;
  const GenreEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
