import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_profile/app_colors.dart';
import 'package:flutter_profile/screens/profile_screen.dart';
import 'package:flutter_profile/screens/category_screen.dart';

import 'package:flutter_profile/bloc/moviebloc/movie_bloc.dart';
import 'package:flutter_profile/bloc/moviebloc/movie_bloc_event.dart';
import 'package:flutter_profile/bloc/moviebloc/movie_bloc_state.dart';
import 'package:flutter_profile/model/movie.dart';

class MoviesScreen extends StatefulWidget {
  final ScrollController scrollController;

  const MoviesScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(const MovieEventStarted(0, '')),
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: const BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(color: Colors.black),
                // ),
                ),
            child: AppBar(
              backgroundColor: AppColors.bgColor,
              title: const Text(
                "TMDB API",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: false,
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: AppColors.textColor,
                    size: 25,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(
                          context); // close any existing route before navigating
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: NestedScrollView(
            controller: widget.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColors.bgColor,
                  // title: const Text(''),
                  // pinned: true,
                  expandedHeight: 220.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is MovieLoaded) {
                          List<Movie> movies = state.movieList;
                          return Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: _buildCarouselSlider(movies),
                          );
                        } else {
                          return const Text('Error');
                        }
                      },
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              color: AppColors.bgColor,
              child: const BuildWidgetCategory(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarouselSlider(List<Movie> movies) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        Movie movie = movies[index];
        return Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                // height:
                //     MediaQuery.of(context).size.height / 3,
                // width: MediaQuery.of(context).size.width,
                // fit: BoxFit.cover,
                placeholder: (context, url) => Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/img_not_fond.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }
}
