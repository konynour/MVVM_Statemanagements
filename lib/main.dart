import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/screens/favorites_screen.dart';
import 'package:mvvm_statemanagements_project/screens/movie_details.dart';
import 'package:mvvm_statemanagements_project/screens/movies_screen.dart';
import 'package:mvvm_statemanagements_project/screens/splash_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:mvvm_statemanagements_project/widgets/my_error_widget.dart';

import 'constants/my_app_themes.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyThemesData.darkTheme,
      // darkTheme: MyThemesData.darkTheme,
      // themeMode: ThemeMode.system,
      home: const MoviesScreen(),
      //const MovieDetailsScreen(), //const FavoritesScreen(), //const MoviesScreen(),
    );
  }
}
