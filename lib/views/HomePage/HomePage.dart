import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/config.dart';
import 'package:firebaseapp/locator.dart';
import 'package:firebaseapp/services/navigation_service.dart';
import 'package:firebaseapp/views/Login/LoginPage.dart';
import 'package:firebaseapp/views/components/rounded_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final NavigationService _navigationService = locator<NavigationService>();
  String email;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(FirebaseAuth.instance.currentUser  == null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()),
      );
    }else{
      email = FirebaseAuth.instance.currentUser.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOMEPAGE'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome ' + email,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                RoundedButton(
                  text: 'Log Out',
                  press: () async{
                    FirebaseAuth.instance.signOut();
                    _navigationService.navigateTo(loginViewRoute);
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
