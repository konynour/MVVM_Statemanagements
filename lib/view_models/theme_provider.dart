import 'package:flutter_riverpod/legacy.dart';
import 'package:mvvm_statemanagements_project/enums/theme_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeEnums>(
  (_) => ThemeProvider(),
);



class ThemeProvider extends StateNotifier<ThemeEnums> {
  final prefsKey = "isDarkMode";
  ThemeProvider() : super(ThemeEnums.dark) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(prefsKey) ?? true;
    state = isDarkMode ? ThemeEnums.dark : ThemeEnums.light;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (state == ThemeEnums.dark) {
      state = ThemeEnums.light;
      await prefs.setBool(prefsKey, true);
    } else {
      state = ThemeEnums.dark;
      await prefs.setBool(prefsKey, false);
    }
  }
}
