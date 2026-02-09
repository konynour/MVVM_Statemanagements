import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // TODO: Add the favorite button functionality
      },
      icon: const Icon(
        MyAppIcons.favoriteOutlineRounded, //color: Colors.red
        size: 20,
      ),
    );
  }
}
