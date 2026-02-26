import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';
import 'package:mvvm_statemanagements_project/screens/favorites_screen.dart';
import 'package:mvvm_statemanagements_project/service/api_service.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/movies_widget.dart';
import 'package:mvvm_statemanagements_project/repository/movies_repo.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MoviesModels> _movies = [];
  //  final List<MoviesGenre> genres = [];

  int _currentpage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;
    });
    try {
      final List<MoviesModels> movies = await getIt<MoviesRepository>()
          .fetchMovies(page: _currentpage);
      setState(() {
        _movies.addAll(movies);
        _currentpage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnackbar("Failed to load movies $error");
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              //TODO Navigate to favorites screen
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(MyAppIcons.favoriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              // final List<MoviesModels> movies = await getIt<ApiService>()
              //     .fetchMovies();
              // log("movies : $movies");
              final List<MoviesGenre> genres = await getIt<MoviesRepository>()
                  .fetchGenre();
              // await getIt<ApiService>().fetchGenre();
              log("genres : $genres");
            },
            icon: const Icon(MyAppIcons.darkMode),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return  MoviesWidget(moviemodel: _movies[index]);
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
