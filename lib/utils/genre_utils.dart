import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/repository/movies_repo.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/view_models/moives_provider.dart';
import 'package:provider/provider.dart';

class GenreUtils {

  // TODO:about the genres
 // and then here we need to create a getter that it will return the sting instead of the int 
 // so here we will do the mapping correctly, so we will get the integers from thee movie's response and 
// map it to the movies list to genres list we have so let's create a  static method for that
// so here i defined the movies repo to get  access to the cached genre list
// we are calling function in order to load all the genres inside splash screen
static List<MoviesGenre> movieGenresNames(List<int> genreIds,BuildContext context){
  final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final moviesRepository = getIt<MoviesRepository>();
   final cachedGenre = moviesProvider.genreslist;  //TODO: we_need_get_the_correct_cachedGenres
    List<MoviesGenre> genreNames = [];
    for (var genreId in genreIds){
      var genre = cachedGenre.firstWhere((g)=>g.id == genreId,
      orElse: () => MoviesGenre(id: 5448484, name: "Unknown"),
      );
      genreNames.add(genre);
      
      
    }
    return genreNames;    

     

  
}



}