import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }
Future<dynamic>? navigate(Widget widget){
return navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => widget));}


Future<dynamic>? navigateReplace(Widget widget){
return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => widget));}

  void showSnackbar(String s) {}
}
