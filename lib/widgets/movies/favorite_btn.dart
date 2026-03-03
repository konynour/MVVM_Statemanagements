import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key});

 @override
  Widget build(BuildContext context) {
    // bool isFavorite = favoriteMovies.contains(widget.moviemodel.id);
    return IconButton(
      onPressed: () {
        // TODO: Add the favorite button functionality
      },
      icon: Icon(
        MyAppIcons.favoriteOutlineRounded,
        color:null, // isFavorite ? Colors.red : null,
      
        size: 20,
      ),
    );
}
}