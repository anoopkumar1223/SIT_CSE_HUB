import 'package:flutter/material.dart';
import 'package:sit_cse_hub/resources/route.dart';
import 'package:sit_cse_hub/screens/notification_screen.dart';
import 'package:sit_cse_hub/screens/timetable_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
