import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/components/user_selection_component.dart';

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
      backgroundColor: R.color.backgroundColor,
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
                  R.string.tellUsWhoYouAre,
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontFamily: R.string.bangers,
                  ),
                ),
              ),
              UserSelectionComponent(
                title: R.string.professor,
                image: R.image.professorGif,
                width: (isProfessor) ? 10.0 : 0,
                onTap: () {
                  setState(() {
                    isProfessor = true;
                    isStudent = false;
                  });
                },
              ),
              UserSelectionComponent(
                title: R.string.student,
                image: R.image.studentGif,
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
      floatingActionButton: RaisedButton(
        color: R.color.primaryTheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(
            15,
          ),
          child: Icon(
            FontAwesomeIcons.arrowRight,
            size: 20,
            color: R.color.whiteColor,
          ),
        ),
      ),
    );
  }
}
