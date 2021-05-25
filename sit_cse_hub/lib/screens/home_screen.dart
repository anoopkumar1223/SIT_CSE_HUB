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
                  Resource.string.getGreeting('Amruth'),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 3,
                    fontFamily: Resource.string.bangers,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Lottie.asset(
                  Resource.image.homeGif,
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
                  Resource.string.home,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: Resource.string.lato,
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
                      colors: Resource.color.royalBlue,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.chalkboardTeacher,
                        size: 40,
                        color: Resource.color.whiteColor,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        Resource.string.lecturePlan,
                        style: TextStyle(
                          fontSize: 18,
                          color: Resource.color.whiteColor,
                          fontFamily: Resource.string.lato,
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
                        color: Resource.color.coolblues,
                        title: Resource.string.notifications,
                        onTap: () {
                          Resource.navigation.push(
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
                        color: Resource.color.purplePink,
                        title: Resource.string.timeTable,
                        onTap: () {
                          Resource.navigation.push(
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
                        color: Resource.color.fbMessenger,
                        title: Resource.string.calendarOfEvents,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: HomePageOption(
                        icon: FontAwesomeIcons.book,
                        color: Resource.color.seaBlue,
                        title: Resource.string.schemeSyllabus,
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
