import 'package:flutter/material.dart';
import 'package:mvvm_statemanagements_project/screens/movies_screen.dart';
import 'package:mvvm_statemanagements_project/service/init_getit.dart';
import 'package:mvvm_statemanagements_project/service/navigation_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'constants/my_app_themes.dart';
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
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyThemesData.darkTheme,
      // darkTheme: MyThemesData.darkTheme,
      // themeMode: ThemeMode.system,
      home: 
      const MoviesScreen(), //const FavoritesScreen(), //const MoviesScreen(),
    );
  }
}
