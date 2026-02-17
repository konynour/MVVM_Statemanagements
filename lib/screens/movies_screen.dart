import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/screens/favorites_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
             //TODO Navigate to favorites screen
             getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(MyAppIcons.favoriteRounded, color: Colors.red),
          ),
          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.darkMode)),
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
