import 'package:flutter/material.dart';
import 'package:sit_cse_hub/resources/route.dart';
import 'package:sit_cse_hub/screens/login_screen.dart';
import 'package:sit_cse_hub/screens/main_screen.dart';
import 'package:sit_cse_hub/screens/notification_screen.dart';
import 'package:sit_cse_hub/screens/timetable_screen.dart';
import 'package:sit_cse_hub/screens/signup_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoute.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case MyRoute.signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case MyRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case MyRoute.notificationScreen:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case MyRoute.timeTableScreen:
        return MaterialPageRoute(builder: (_) => TimeTable());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
