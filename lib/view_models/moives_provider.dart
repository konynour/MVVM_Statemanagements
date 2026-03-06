import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';
import 'package:mvvm_statemanagements_project/repository/movies_repo.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';

class MoviesProvider with ChangeNotifier{
  int _currentpage = 1;
  final List<MoviesModels> _movieslist = [];
  List <MoviesModels> get movieslist => _movieslist;

  List<MoviesGenre> _genreslist = [];
  List <MoviesGenre> get genreslist => _genreslist;


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  String _fetchMoviesError = "";
  String get fetchMoviesError => _fetchMoviesError;
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

Future<void> getMovies() async{
  _isLoading = true;
  notifyListeners();
  try{
    if(_genreslist.isEmpty){
      _genreslist = await _moviesRepository.fetchGenre();
    }
    List<MoviesModels> movies = await _moviesRepository.fetchMovies(page: _currentpage);
    _movieslist.addAll(movies);
    _currentpage++;
    
  }catch(error){
    _fetchMoviesError = error.toString();
    notifyListeners();
  }finally{
    _isLoading = false;
    notifyListeners();
  }
  
}
  
}