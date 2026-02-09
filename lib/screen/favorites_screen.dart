import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_constants.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/widgets/cached_iamge.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const MoviesWidget();
        },
      ),
    );
  }
}
