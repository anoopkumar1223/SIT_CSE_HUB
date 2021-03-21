import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/main_page_navbutton.dart';
import 'package:sit_cse_hub/components/main_page_navbutton_tapped.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/screens/home_screen.dart';
import 'package:sit_cse_hub/screens/settings_screen.dart';
import 'package:sit_cse_hub/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var todoIcon = Icons.list;
  var homeIcon = Icons.home;
  var profileIcon = Icons.settings;

  bool todoButtonPressed = false;
  bool homeButtonPressed = true;
  bool profileButtonPressed = false;

  void pressTodo() {
    setState(() {
      todoButtonPressed = true;
      homeButtonPressed = false;
      profileButtonPressed = false;
    });
  }

  void pressHome() {
    setState(() {
      todoButtonPressed = false;
      homeButtonPressed = true;
      profileButtonPressed = false;
    });
  }

  void pressProfile() {
    setState(() {
      todoButtonPressed = false;
      homeButtonPressed = false;
      profileButtonPressed = true;
    });
  }

  Widget getScreen() {
    if (todoButtonPressed == true)
      return TodoScreen();
    else if (homeButtonPressed == true)
      return HomeScreen();
    else
      return SettingsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          60,
        ),
        child: AppBar(
          backgroundColor: R.color.backgroundColor,
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                right: 10,
              ),
              child: CircleAvatar(
                backgroundColor: R.color.blueGrey,
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: Lottie.asset(
                    R.image.profileGif,
                    height: 40,
                  ),
                ),
              ),
            )
          ],
          title: Text(
            R.string.sitCseHub,
            style: TextStyle(
              color: R.color.blackColor,
              letterSpacing: 2,
              fontFamily: R.string.lato,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: R.color.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: getScreen(),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Divider(
            thickness: 1.5,
            height: 1.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (todoButtonPressed)
                    ? MainPageNavButtonTapped(
                        icon: todoIcon,
                        onTap: pressTodo,
                      )
                    : MainPageNavButton(
                        icon: todoIcon,
                        onTap: pressTodo,
                      ),
                (homeButtonPressed)
                    ? MainPageNavButtonTapped(
                        icon: homeIcon,
                        onTap: pressHome,
                      )
                    : MainPageNavButton(
                        icon: homeIcon,
                        onTap: pressHome,
                      ),
                (profileButtonPressed)
                    ? MainPageNavButtonTapped(
                        icon: profileIcon,
                        onTap: pressProfile,
                      )
                    : MainPageNavButton(
                        icon: profileIcon,
                        onTap: pressProfile,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
