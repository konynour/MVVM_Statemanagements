import 'package:mvvm_statemanagements_project/constants/my_app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class ThemeProvider with ChangeNotifier{
   ThemeData _themeData= MyThemesData.lightTheme;
   ThemeData get themeData => _themeData;

   final String themeKey="isDarkMode";
  Future<void> toggleTheme()async{
    final prefs = await SharedPreferences.getInstance();
    _themeData =  _themeData == MyThemesData.darkTheme ? MyThemesData.lightTheme : MyThemesData.darkTheme;
    await prefs.setBool(themeKey,  _themeData == MyThemesData.darkTheme );
    notifyListeners();
  
  }
}