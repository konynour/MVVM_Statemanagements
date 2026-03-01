import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';
import 'package:mvvm_statemanagements_project/service/api_service.dart';

class MoviesRepository {
  final ApiService _apiService;

  MoviesRepository(this._apiService);
  Future<List<MoviesModels>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }
  List<MoviesGenre> cachedGenre = [];
  Future<List<MoviesGenre>> fetchGenre() async {
    return  cachedGenre = await _apiService.fetchGenre();
  }
}
