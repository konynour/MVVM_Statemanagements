import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_model.dart';

class MoviesState{
  final int currentpage;
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
  
}
  
