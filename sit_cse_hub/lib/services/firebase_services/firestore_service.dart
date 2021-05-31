import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sit_cse_hub/components/custom_error_dialog.dart';

class Database {
  static Future addStudentData({
    @required String fName,
    @required String lName,
    @required String usn,
    @required String phone,
    @required String year,
    @required String section,
    @required BuildContext context,
  }) async {
    DocumentReference studentDocument;
    Map<String, dynamic> studentData = {
      'firstName': fName,
      'lastName': lName,
      'usn': usn,
      'phone': phone,
      'year': year,
      'section': section,
    };
    studentDocument = FirebaseFirestore.instance
        .collection('student')
        .doc(year)
        .collection(section)
        .doc(usn.toLowerCase());
    try {
      return await studentDocument.set(studentData);
    } catch (error) {
      CustomErrorDialog.getErrorBox(context, error.message);
    }
  }

  static Future addNotification({
    @required String title,
    @required String desc,
    @required sendTo,
    String year,
    String section,
    @required String faculty,
    @required String dateTime,
    String attachmentUrl,
    @required BuildContext context,
  }) async {
    Map<String, dynamic> notification = {
      'title': title,
      'desc': desc,
      'faculty': faculty,
      'dateTime': dateTime,
      'attachmentUrl': attachmentUrl,
    };
    if (sendTo == 0) {
      try {
        FirebaseFirestore.instance
            .collection('notifications')
            .doc('everyone')
            .collection('everyone')
            .add(notification);
      } catch (error) {
        CustomErrorDialog.getErrorBox(context, error);
      }
    } else {
      try {
        print(year);
        print(section);
        FirebaseFirestore.instance
            .collection('notifications')
            .doc(year)
            .collection(section)
            .add(notification);
      } catch (error) {
        CustomErrorDialog.getErrorBox(context, error);
      }
    }
  }
}
