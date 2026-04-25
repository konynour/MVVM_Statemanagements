import 'package:flutter_riverpod/legacy.dart';
import 'package:mvvm_statemanagements_project/models/movies_model.dart';
import 'package:mvvm_statemanagements_project/view_models/movies/movies_state.dart';
import '../../repository/movies_repo.dart';
import '../../service/init_getit.dart';

class MoviesProvider extends StateNotifier<MoviesState> {
  MoviesProvider(): super(MoviesState());
  
  final MoviesRepository _moviesRepository =getIt<MoviesRepository>();
  Future<void> getMovies()async{
    state = state.copyWith(isLoading: true);
    try{
      if(state.moviesList.isEmpty){
        final generesList= await _moviesRepository.fetchGenres();
        state = state.copyWith(genresList: generesList );    
      }
      List<MovieModel> movies = await _moviesRepository.fetchMovies(page: state.currentpage! );
      state =state.copyWith(moviesList: [...state.moviesList ,...movies ], currentpage: state.currentpage! +1, isLoading: false);

      


    } catch (error) {
      state = state.copyWith(fetchMoviesError: error.toString() , isLoading: false);
      rethrow;
    }
    
  }


  

}

