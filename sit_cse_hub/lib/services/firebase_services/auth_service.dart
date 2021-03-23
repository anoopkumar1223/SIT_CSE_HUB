import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sit_cse_hub/components/custom_error_dialog.dart';
import 'package:sit_cse_hub/resources/navigation.dart';
import 'package:sit_cse_hub/resources/route.dart';

class MyAuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static void signIn(String email, String password, var context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      User user = userCredential.user;
      String uid = user.uid;
      Map userDetails = {
        'uid': uid,
      };
      MyNavigation().pop(context: context);
      MyNavigation().pushReplacement(
        context: context,
        screen: MyRoute.mainScreen,
        arguments: userDetails,
      );
    } catch (e) {
      MyNavigation().pop(context: context);
      switch (e.code) {
        case 'network-request-failed':
          CustomErrorDialog.getErrorBox(
            context,
            'Please make sure your device has an internet connection',
          );
          break;
        case 'invalid-email':
          CustomErrorDialog.getErrorBox(
            context,
            'Please enter a valid Email Id',
          );
          break;
        case 'wrong-password':
          CustomErrorDialog.getErrorBox(
            context,
            'Incorrect password',
          );
          break;
        case 'user-not-found':
          CustomErrorDialog.getErrorBox(
            context,
            'You have not yet registered. Register now',
          );
          break;
        case 'user-disabled':
          CustomErrorDialog.getErrorBox(
            context,
            'User has been disabled due to security reasons. Contact your proctor.',
          );
          break;
        case 'too-many-requests':
          CustomErrorDialog.getErrorBox(
            context,
            'You have tried maximum times with wrong credentials. Please try later',
          );
          break;
        case 'operation-not-allowed':
          CustomErrorDialog.getErrorBox(
            context,
            'Operation not allowed. Try later or contact the administrator',
          );
          break;
        default:
          CustomErrorDialog.getErrorBox(context,
              e.message + ' Report this error here: support@sitcsehub.in');
          break;
      }
    }
  }

  static void passwordReset(BuildContext context, String email) async {
    try {
      if (email != null) email = email.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      MyNavigation().pop(context: context);
      MyNavigation().pop(context: context);
      CustomErrorDialog.getErrorBox(
        context,
        'Verification link has been sent to $email',
      );
    } on FirebaseAuthException catch (e) {
      MyNavigation().pop(context: context);
      MyNavigation().pop(context: context);
      switch (e.code) {
        case 'network-request-failed':
          CustomErrorDialog.getErrorBox(
            context,
            'Please make sure your device has an internet connection',
          );
          break;
        case 'invalid-email':
          CustomErrorDialog.getErrorBox(
            context,
            'Please enter a valid Email Id',
          );
          break;
        case 'user-not-found':
          CustomErrorDialog.getErrorBox(
            context,
            'You have not yet registered. Register now',
          );
          break;
        case 'too-many-requests':
          CustomErrorDialog.getErrorBox(
            context,
            'You have tried maximum times with wrong credentials. Please try later',
          );
          break;
        case 'unknown':
          CustomErrorDialog.getErrorBox(
            context,
            'Please enter the Email id',
          );
          break;
        default:
          CustomErrorDialog.getErrorBox(context,
              e.message + ' ' + 'Report this error here: support@sitcsehub.in');
          break;
      }
    }
  }

  static Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: email);
      return Future.value(user);
    } catch (error) {
      switch (error.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          print("Email Already Exists");
          break;
        case 'ERROR_INVALID_EMAIL':
          print("Invalid Email Address");
          break;
        case 'ERROR_WEAK_PASSWORD':
          print("Please Choose a stronger password");
          break;
      }
      return Future.value(null);
    }
  }
}
