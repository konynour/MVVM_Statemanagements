import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/screen/favorites_screen.dart';
import 'package:mvvm_statemanagements_project/screen/movie_details.dart';
import 'package:mvvm_statemanagements_project/screen/movies_screen.dart';
import 'package:mvvm_statemanagements_project/screen/splash_screen.dart';
import 'package:mvvm_statemanagements_project/widgets/my_error_widget.dart';

import 'constants/my_app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyThemesData.darkTheme,
      // darkTheme: MyThemesData.darkTheme,
      // themeMode: ThemeMode.system,
      home: const SplashScreen(),
      //const MovieDetailsScreen(), //const FavoritesScreen(), //const MoviesScreen(),
    );
  }
}
