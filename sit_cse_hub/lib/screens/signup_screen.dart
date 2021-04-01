import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/custom_loader.dart';
import 'package:sit_cse_hub/components/custom_textfield.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/resources/route.dart';
import 'package:sit_cse_hub/services/firebase_services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController;
  TextEditingController passwordController;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  Function emailValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    return null;
  };

  Function passwordValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Resource.color.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      Resource.string.register,
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontFamily: Resource.string.bangers,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              Resource.string.welcome,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: Resource.string.lato,
                              ),
                            ),
                            Text(
                              Resource.string.signUp,
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: Resource.string.lato,
                              ),
                            ),
                          ],
                        ),
                        Lottie.asset(
                          Resource.image.registerGif,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          title: Resource.string.email,
                          hintText: Resource.string.usn,
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          validator: emailValidator,
                          onSaved: (value) {
                            email = value;
                          },
                          isObscure: false,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          title: Resource.string.password,
                          hintText: Resource.string.maskedPassword,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          validator: passwordValidator,
                          onSaved: (value) {
                            password = value;
                          },
                          isObscure: true,
                          onFieldSubmitted: (a) =>
                              FocusScope.of(context).unfocus(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Resource.color.primaryTheme,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            CustomLoader.getLoader(context);
                            MyAuthService.signUp(email, password, context);
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              child: Text(
                                Resource.string.signUp,
                                style: TextStyle(
                                  fontFamily: Resource.string.lato,
                                  fontSize: 17,
                                  color: Resource.color.backgroundColor,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Resource.string.alreadyRegistered,
                        style: TextStyle(
                          fontFamily: Resource.string.lato,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () {
                          Resource.navigation.pushReplacement(
                            context: context,
                            screen: MyRoute.loginScreen,
                          );
                        },
                        child: Text(
                          Resource.string.login,
                          style: TextStyle(
                            color: Resource.color.primaryTheme,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontFamily: Resource.string.lato,
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
        ),
      ),
    );
  }
}
