import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/custom_icon_button.dart';
import 'package:sit_cse_hub/components/custom_notification_add.dart';
import 'package:sit_cse_hub/components/notification_bean.dart';
import 'package:sit_cse_hub/components/notification_component.dart';
import 'package:sit_cse_hub/resources/resource.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController titleController;
  TextEditingController descController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Resource.color.backgroundColor,
        appBar: AppBar(
          backgroundColor: Resource.color.backgroundColor,
          centerTitle: true,
          title: Text(
            Resource.string.notification,
            style: TextStyle(
              color: Resource.color.blackColor,
              letterSpacing: 5,
              fontFamily: Resource.string.bangers,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              30,
              15,
              20,
            ),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/images/notification.json',
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomIconButton(
                  onPressed: () {
                    CustomNotificationAdd.getErrorBox(
                      context: context,
                      titleController: titleController,
                      descController: descController,
                    );
                  },
                  borderRadius: 50,
                  horizontalPadding: 20,
                  verticalPadding: 20,
                  icon: Icons.add,
                  iconSize: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                getStreamBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getStreamBuilder() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('notifications')
          .doc('I')
          .collection('A')
          .orderBy('dateTime')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData != true) {
          return SpinKitFadingCircle(
            color: Resource.color.primaryTheme,
            size: 50.0,
          );
        }
        return ListView(
          shrinkWrap: true,
          children: snapshot.data.docs.map((document) {
            return Column(
              children: [
                NotificationComponent(
                  notificationBean: NotificationBean(
                    title: document['title'],
                    desc: document['desc'],
                    faculty: document['faculty'],
                    dateTime: document['dateTime'],
                    attachmentUrl: document['attachmentUrl'],
                    picUrl: 'assets/images/logo.jpg',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
