import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/screens/movies_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm_statemanagements_project/view_models/moives_provider.dart';
import 'package:mvvm_statemanagements_project/view_models/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ), //..loadTheme)

        ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ],
      child: Consumer(
        builder: (context, ThemeProvider themeProvider, child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            // darkTheme: MyThemesData.darkTheme,
            // themeMode: ThemeMode.system,
            home:
                const MoviesScreen(), //const FavoritesScreen(), //const MoviesScreen(),
          );
        },
      ),
    );
  }
}
