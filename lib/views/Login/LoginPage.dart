import 'package:firebaseapp/config.dart';
import 'package:firebaseapp/locator.dart';
import 'package:firebaseapp/services/dialog_service.dart';
import 'package:firebaseapp/services/navigation_service.dart';
import 'package:firebaseapp/viewmodels/login_view_model.dart';
import 'package:firebaseapp/views/components/facebook_button.dart';
import 'package:firebaseapp/views/components/google_button.dart';
import 'package:firebaseapp/views/components/rounded_button.dart';
import 'package:firebaseapp/views/components/rounded_input_text_box.dart';
import 'package:firebaseapp/views/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color(0xFFF0F0F0),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/login.svg",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Login to your existing account of Q Allure',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Color(0xFFA1A1A1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: RoundedInputField(
                            hintText: "Your Email",
                            icon: Icons.email,
                            controller: emailController,
                            onChanged: (email) {
                              if (email.isEmpty) {
                                return 'Fields cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: RoundedPasswordField(
                            icon: Icons.lock,
                            controller: passwordController,
                            onChanged: (password) {
                              if (password.isEmpty) {
                                return 'Fields cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: RoundedButton(
                            text: "LOG IN",
                            press: () async {
                              if (emailController.text.isNotEmpty ||
                                  passwordController.text.isNotEmpty) {
                                model.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context);
                              } else {
                                await _dialogService.showDialog(
                                  title: 'Login Failure',
                                  description: 'Oops! Blank Input',
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'or connect using',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Color(0xFFA1A1A1),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FacebookButton(
                                text: "FACEBOOK",
                                press: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GoogleButton(
                                text: "GOOGLE",
                                press: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account?',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Color(0xFFA1A1A1),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _navigationService.navigateTo(signUpViewRoute);
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => LoginViewModel());
  }
}
