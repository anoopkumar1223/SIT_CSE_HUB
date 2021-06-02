import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static SharedPreferences preferences;

  static void initializeSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void addStudentData({
    @required String fName,
    @required String email,
    @required String year,
    @required String section,
  }) {
    preferences.setString('fName', fName);
    preferences.setString('email', email);
    preferences.setString('year', year);
    preferences.setString('section', section);
  }

  static Map<String, String> getStudentData() {
    Map<String, String> details = {};
    details['fName'] = preferences.getString('fName');
    details['email'] = preferences.getString('email');
    details['year'] = preferences.getString('year');
    details['section'] = preferences.getString('section');
    return details;
  }

  static String getStudentFirstName() {
    return preferences.getString('fName');
  }

  static String getStudentLastName() {
    return preferences.getString('lName');
  }

  static String getStudentEmail() {
    return preferences.getString('email');
  }

  static String getStudentPhone() {
    return preferences.getString('phone');
  }

  static String getStudentYear() {
    return preferences.getString('year');
  }

  static String getStudentSection() {
    return preferences.getString('section');
  }
}
