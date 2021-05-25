import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/resources/resource.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Lottie.asset(
                  'assets/images/notification.json',
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Resource.color.whiteColor,
                          radius: 40,
                          child: Image.network(
                            'https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.kauveryhospital.com%2Fdoctorimage%2Frecent%2Ftennur%2FDr-Sumathi-ravikumar.jpg&imgrefurl=https%3A%2F%2Fwww.kauveryhospital.com%2Fdoctors%2Ftrichy-tennur%2Fgeneral-surgery%2Fdr-r-sumathi-ravikumar&tbnid=rl3sg1ifb7t0-M&vet=12ahUKEwiL-4qwup7wAhWyDrcAHVAjAkAQMygAegUIARCBAQ..i&docid=4sxzZGFfpGFVlM&w=600&h=703&q=dr%20r%20sumathi&ved=2ahUKEwiL-4qwup7wAhWyDrcAHVAjAkAQMygAegUIARCBAQ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
