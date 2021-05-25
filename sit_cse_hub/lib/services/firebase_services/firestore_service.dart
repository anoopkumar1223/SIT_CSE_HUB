import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sit_cse_hub/components/custom_error_dialog.dart';

class Database {
  static DocumentReference studentDocument;

  static Future addStudentData({
    @required String fName,
    @required String lName,
    @required String usn,
    @required String phone,
    @required String year,
    @required String section,
    @required BuildContext context,
  }) async {
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
}
