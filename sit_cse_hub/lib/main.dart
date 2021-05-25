import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sit_cse_hub/resources/router.dart';
import 'package:sit_cse_hub/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
