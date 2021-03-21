import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/custom_textfield.dart';
import 'package:sit_cse_hub/resources/resource.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController;
  TextEditingController passwordController;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          R.string.welcome,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: R.string.lato,
                          ),
                        ),
                        Text(
                          R.string.login,
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: R.string.lato,
                          ),
                        ),
                      ],
                    ),
                    Lottie.asset(
                      R.image.loginGif,
                      height: 250,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                title: R.string.email,
                hintText: R.string.usn,
                keyboardType: TextInputType.text,
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                isObscure: false,
                onFieldSubmitted: (a) => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                title: R.string.password,
                hintText: R.string.maskedPassword,
                keyboardType: TextInputType.text,
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                isObscure: true,
                onFieldSubmitted: (a) => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment(1.0, 0.0),
                padding: EdgeInsets.only(
                  right: 10.0,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    R.string.forgotPassword,
                    style: TextStyle(
                      fontFamily: R.string.lato,
                      color: R.color.primaryTheme,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: R.color.primaryTheme,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                onPressed: () {
                  print(email);
                  print(password);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Text(
                      R.string.login,
                      style: TextStyle(
                        fontFamily: R.string.lato,
                        fontSize: 17,
                        color: R.color.backgroundColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    R.string.noAccount,
                    style: TextStyle(
                      fontFamily: R.string.lato,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      R.string.signUp,
                      style: TextStyle(
                        color: R.color.primaryTheme,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontFamily: R.string.lato,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
