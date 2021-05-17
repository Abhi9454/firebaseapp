import 'package:firebaseapp/views/HomePage/HomePage.dart';
import 'package:firebaseapp/views/Login/LoginPage.dart';
import 'package:firebaseapp/views/SignUp/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/config.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginPage(),
      );
    case signUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupPage(),
      );
    case homeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}