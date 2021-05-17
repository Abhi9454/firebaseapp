import 'package:firebaseapp/locator.dart';
import 'package:firebaseapp/services/dialog_service.dart';
import 'package:firebaseapp/viewmodels/signup_view_model.dart';
import 'package:firebaseapp/views/Login/LoginPage.dart';
import 'package:firebaseapp/views/components/rounded_button.dart';
import 'package:firebaseapp/views/components/rounded_input_text_box.dart';
import 'package:firebaseapp/views/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final DialogService _dialogService = locator<DialogService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, widget) => Scaffold(
        backgroundColor: Color(0xFFF0F0F0),
        appBar: AppBar(
          backgroundColor: Color(0xFFF0F0F0),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Let\'s Get Started!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Create an account with Q Allure to get all features',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Color(0xFFA1A1A1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedInputField(
                        hintText: "Name",
                        icon: Icons.person,
                        controller: nameController,
                        onChanged: (name) {
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedInputField(
                        hintText: "Email",
                        icon: Icons.email,
                        controller: emailController,
                        onChanged: (email) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedInputField(
                        hintText: "Phone",
                        icon: Icons.phone,
                        controller: phoneController,
                        onChanged: (phone) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedPasswordField(
                        icon: Icons.lock,
                        controller: passwordController,
                        onChanged: (password) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedPasswordField(
                        icon: Icons.lock,
                        controller:passwordConfirmController,
                        onChanged: (email) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RoundedButton(
                        text: "Sign Up",
                        press: () async {
                          if(passwordController.text == passwordConfirmController.text){
                            model.signUp(email: emailController.text, password: passwordController.text,context: context);
                          }
                          else{
                            await _dialogService.showDialog(
                              title: 'Password mismatch',
                              description: 'Password and confirm password do not match',
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an Account?',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Login',
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
      ),
    );
  }
}
