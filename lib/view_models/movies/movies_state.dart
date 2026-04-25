import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_model.dart';

class MoviesState{
  final int? currentpage;
  final List<MovieModel> moviesList;
  final List<MoviesGenre> genresList;
  final String? fetchMoviesError;
  final bool isLoading;


  MoviesState({
    this.currentpage = 1,
    this.moviesList = const [],
    this.genresList = const [],
    this.fetchMoviesError = '',
    this.isLoading = false,


  });

  MoviesState copyWith({
    int? currentpage,
    List<MovieModel>? moviesList,
    List<MoviesGenre>? genresList,
    String? fetchMoviesError,
    bool? isLoading,
  }) {
    return MoviesState(
      currentpage: currentpage ?? this.currentpage,
      moviesList: moviesList ?? this.moviesList,
      genresList: genresList ?? this.genresList,
      isLoading: isLoading ?? this.isLoading,
      fetchMoviesError: fetchMoviesError ?? this.fetchMoviesError,
    );
  }
}
  
