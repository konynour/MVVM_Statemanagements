import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/constants/my_app_icons.dart';
import 'package:mvvm_statemanagements_project/models/movies_genre.dart';
import 'package:mvvm_statemanagements_project/repository/movies_repo.dart';
import 'package:mvvm_statemanagements_project/screens/favorites_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/view_models/theme_provider.dart';
import 'package:mvvm_statemanagements_project/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

 @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
          IconButton(
            onPressed: () async {
              themeProvider.toggleTheme();




              // final List<MoviesModels> movies = await getIt<ApiService>()
              //     .fetchMovies();
              // log("movies : $movies");
              final List<MoviesGenre> genres = await getIt<MoviesRepository>()
                  .fetchGenre();
              // await getIt<ApiService>().fetchGenre();
            },
            icon: const Icon(MyAppIcons.darkMode),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
         return MoviesWidget();
        },
      ),
    );
  }
}
