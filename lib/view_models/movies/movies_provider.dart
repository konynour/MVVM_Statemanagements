import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_model.dart';

class MoviesState{
  final bool isLoading;
  final int currentPage;
  final List<MovieModel> moviesList;
  final List<MoviesGenre> genresList;
  final String? fatchMoviesError;


  MoviesState({
    this.isLoading = false,
    this.currentPage = 1,
    this.moviesList = const [],
    this.genresList = const [],
    this.fatchMoviesError=  '',
  });

}