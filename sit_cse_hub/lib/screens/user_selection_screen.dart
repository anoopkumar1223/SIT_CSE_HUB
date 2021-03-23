import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/components/user_selection_component.dart';
import 'package:sit_cse_hub/resources/route.dart';

class UserSelectionScreen extends StatefulWidget {
  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  bool isStudent = false;
  bool isProfessor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resource.color.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(
                  Resource.string.tellUsWhoYouAre,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontFamily: Resource.string.bangers,
                  ),
                ),
              ),
              UserSelectionComponent(
                title: Resource.string.professor,
                image: Resource.image.professorGif,
                width: (isProfessor) ? 10.0 : 0,
                onTap: () {
                  setState(() {
                    isProfessor = true;
                    isStudent = false;
                  });
                },
              ),
              UserSelectionComponent(
                title: Resource.string.student,
                image: Resource.image.studentGif,
                width: (isStudent) ? 10.0 : 0,
                onTap: () {
                  setState(() {
                    isStudent = true;
                    isProfessor = false;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Resource.color.primaryTheme,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {
          Resource.navigation.push(
            context: context,
            screen: MyRoute.loginScreen,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(
            15,
          ),
          child: Icon(
            FontAwesomeIcons.arrowRight,
            size: 20,
            color: Resource.color.whiteColor,
          ),
        ),
      ),
    );
  }
}
