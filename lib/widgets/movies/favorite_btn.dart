import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/models/movies_models.dart';

class FavoriteBtn extends StatefulWidget {
  const FavoriteBtn({super.key, required this.moviemodel});
final MoviesModels moviemodel;

  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  final favoriteMovies = [];
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteMovies.contains(widget.moviemodel.id);
    return IconButton(
      onPressed: () {
        // TODO: Add the favorite button functionality

        if(isFavorite){
          favoriteMovies.remove(widget.moviemodel.id);
        }else{
          favoriteMovies.add(widget.moviemodel.id);
        }
        setState(() {
          
        });
      },
      icon: Icon(
        isFavorite ? MyAppIcons.favorite : MyAppIcons.favoriteOutlineRounded,
        color: isFavorite ? Colors.red : null,
      
        size: 20,
      ),
    );
  }
}
