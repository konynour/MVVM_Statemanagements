import 'package:mvvm_statemanagements_project/constants/my_app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class ThemeProvider with ChangeNotifier{
   ThemeData _themeMode= MyThemesData.lightTheme;
   ThemeData get themeData => _themeMode;
    

   final String themeKey="isDarkMode";  //TODO :load function  to save theme 
ThemeProvider(){
  loadTheme();
}
   Future<void> loadTheme()async{
   final prefs = await SharedPreferences.getInstance();  //  TODO :small check if we have something saved in memory or not
   final isDrarkMode = prefs.getBool(themeKey) ?? true;
   _themeMode = isDrarkMode 
   ? MyThemesData.lightTheme 
   : MyThemesData.darkTheme;
   notifyListeners();
  }


  Future<void> toggleTheme()async{
    final prefs = await SharedPreferences.getInstance();
    _themeMode =  _themeMode == MyThemesData.darkTheme ? MyThemesData.lightTheme : MyThemesData.darkTheme;
    await prefs.setBool(themeKey,  _themeMode == MyThemesData.darkTheme );
    notifyListeners();
  
  }
}