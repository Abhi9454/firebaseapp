import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/config.dart';
import 'package:firebaseapp/locator.dart';
import 'package:firebaseapp/managers/dialog_managers.dart';
import 'package:firebaseapp/services/dialog_service.dart';
import 'package:firebaseapp/services/navigation_service.dart';
import 'package:firebaseapp/views/HomePage/HomePage.dart';
import 'package:firebaseapp/views/Login/LoginPage.dart';
import 'package:firebaseapp/views/route.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppConfig().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: HomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}
