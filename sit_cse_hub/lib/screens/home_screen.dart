import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/homepage_options.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/resources/route.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  R.string.getGreeting('Amruth'),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                    fontFamily: R.string.lobster,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Lottie.asset(
                  R.image.homeGif,
                  height: 180,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  R.string.home,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: R.string.lato,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: R.color.royalBlue,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.chalkboardTeacher,
                        size: 40,
                        color: R.color.whiteColor,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        R.string.lecturePlan,
                        style: TextStyle(
                          fontSize: 18,
                          color: R.color.whiteColor,
                          fontFamily: R.string.lato,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: HomePageOption(
                        icon: FontAwesomeIcons.bullhorn,
                        color: R.color.coolblues,
                        title: R.string.notifications,
                        onTap: () {
                          R.navigation.push(
                            context: context,
                            screen: MyRoute.notificationScreen,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: HomePageOption(
                        icon: FontAwesomeIcons.clipboardList,
                        color: R.color.purplePink,
                        title: R.string.timeTable,
                        onTap: () {
                          R.navigation.push(
                            context: context,
                            screen: MyRoute.timeTableScreen,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: HomePageOption(
                        icon: FontAwesomeIcons.calendar,
                        color: R.color.fbMessenger,
                        title: R.string.calendarOfEvents,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: HomePageOption(
                        icon: FontAwesomeIcons.book,
                        color: R.color.seaBlue,
                        title: R.string.schemeSyllabus,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
