import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile/app_colors.dart';
import 'package:flutter_profile/bloc/genrebloc/genre_state.dart';
import 'package:flutter_profile/bloc/moviebloc/movie_bloc_state.dart';

import '../bloc/genrebloc/genre_bloc.dart';
import '../bloc/genrebloc/genre_event.dart';
import '../bloc/moviebloc/movie_bloc.dart';
import '../bloc/moviebloc/movie_bloc_event.dart';
import '../model/genre.dart';
import '../model/movie.dart';

class BuildWidgetCategory extends StatefulWidget {
  final int selectedGenre;

  const BuildWidgetCategory({Key? key, this.selectedGenre = 28})
      : super(key: key);

  @override
  BuildWidgetCategoryState createState() => BuildWidgetCategoryState();
}

class BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  late int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenreBloc>(
          create: (_) => GenreBloc()..add(const GenreEventStarted(0, '')),
        ),
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(selectedGenre, '')),
        ),
      ],
      child: _buildGenre(context),
    );
  }

  Widget _buildGenre(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<GenreBloc, GenreState>(
          builder: (context, state) {
            if (state is GenreLoading) {
              return Center(
                child: Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              );
            } else if (state is GenreLoaded) {
              List<Genre> genres = state.genreList;
              return Container(
                height: 45,
                color: AppColors.bgColor,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const VerticalDivider(
                    color: AppColors.bgColor,
                    width: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    Genre genre = genres[index];
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Genre genre = genres[index];
                              selectedGenre = genre.id;
                              context
                                  .read<MovieBloc>()
                                  .add(MovieEventStarted(selectedGenre, ''));
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.blueColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25),
                              ),
                              color: (genre.id == selectedGenre)
                                  ? AppColors.blueColor
                                  : AppColors.bgColor,
                            ),
                            child: Text(
                              genre.name.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: (genre.id == selectedGenre)
                                    ? AppColors.textColor
                                    : AppColors.blueColor,
                                fontFamily: 'muli',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Movie List'.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            fontFamily: 'muli',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center();
            } else if (state is MovieLoaded) {
              List<Movie> movieList = state.movieList;

              return Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 25.0,
                  childAspectRatio: 0.6,
                  children: List.generate(
                    movieList.length,
                    (index) {
                      Movie movie = movieList[index];
                      return Container(
                        color: AppColors.bgColor,
                        child: _movieList(movie),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget _movieList(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         MovieDetailScreen(movie: movie),
            //   ),
            // );
          },
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl:
                  'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 180,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => SizedBox(
                width: 180,
                height: 210,
                child: Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 180,
                height: 210,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_not_found.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 180,
          child: Text(
            movie.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 51,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: _getVoteAverageColor(movie.voteAverage),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
            color: _getVoteAverageBorderColor(movie.voteAverage),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                movie.voteAverage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Color _getVoteAverageColor(String voteAverage) {
  final double rating = double.tryParse(voteAverage) ?? 0.0;
  if (rating >= 7.0) {
    return AppColors.green;
  } else if (rating >= 5.0) {
    return AppColors.yellow;
  } else {
    return AppColors.red;
  }
}

Color _getVoteAverageBorderColor(String voteAverage) {
  final double rating = double.tryParse(voteAverage) ?? 0.0;
  if (rating >= 7.0) {
    return AppColors.greenAlt;
  } else if (rating >= 5.0) {
    return AppColors.yellowAlt;
  } else {
    return AppColors.redAlt;
  }
}
