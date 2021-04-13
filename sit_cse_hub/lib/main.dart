import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/resources/router.dart';
import 'package:sit_cse_hub/screens/details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Resource.color.primaryTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(),
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
