import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/my_app_icons.dart';
import '../enums/theme_enums.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view_models/theme_provider.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

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
              // getIt<NavigationService>().showSnackbar();
              // getIt<NavigationService>().showDialog(MoviesWidget());
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              MyAppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final themeState = ref.watch(themeProvider);
            return IconButton(
              onPressed: () async {
                await ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: Icon(
                themeState == ThemeEnums.dark
                    ? MyAppIcons.darkMode
                    : MyAppIcons.lightMode,
              ),
            );
          })
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