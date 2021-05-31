import 'package:flutter/material.dart';
import 'package:sit_cse_hub/components/custom_dropdown.dart';
import 'package:sit_cse_hub/components/custom_loader.dart';
import 'package:sit_cse_hub/components/custom_textfield.dart';
import 'package:sit_cse_hub/resources/navigation.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/services/firebase_services/firestore_service.dart';
import 'package:intl/intl.dart';

class CustomNotificationAdd {
  static Future<dynamic> getErrorBox({
    BuildContext context,
    TextEditingController titleController,
    TextEditingController descController,
  }) {
    bool isEveryone;
    int selectedRadio = -1;
    String title;
    String desc;
    String year;
    String section;
    List<String> yearList = ['I', 'II', 'III', 'IV'];
    List<String> sectionList = ['A', 'B', 'C'];
    final _formKey = GlobalKey<FormState>();

    Function titleValidator = (String value) {
      if (value.isEmpty) return Resource.string.required;
      return null;
    };

    Function descValidator = (String value) {
      if (value.isEmpty) return Resource.string.required;
      return null;
    };

    Function yearFormValidator = (String value) {
      if (value == null) return Resource.string.required;
      return null;
    };

    Function sectionFormValidator = (String value) {
      if (value == null) return Resource.string.required;
      return null;
    };

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                'Please provide all the details',
                style: TextStyle(
                  fontFamily: Resource.string.lato,
                ),
              ),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomTextField(
                        title: 'Title',
                        hintText: '',
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        isObscure: false,
                        onSaved: (value) {
                          title = value;
                        },
                        validator: titleValidator,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        title: 'Description',
                        hintText: '',
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        isObscure: false,
                        onSaved: (value) {
                          desc = value;
                        },
                        validator: descValidator,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Send to',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: Resource.string.lato,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            activeColor: Resource.color.primaryTheme,
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                isEveryone = true;
                              });
                            },
                          ),
                          Text(
                            'Everyone',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            activeColor: Resource.color.primaryTheme,
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value;
                                isEveryone = false;
                              });
                            },
                          ),
                          Text(
                            'Select',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      (isEveryone == false)
                          ? Column(
                              children: <Widget>[
                                CustomDropDown(
                                  title: 'Year',
                                  options: yearList,
                                  selectedOption: year,
                                  onChanged: (newValue1) {
                                    setState(() {
                                      year = newValue1;
                                    });
                                  },
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  formValidator: yearFormValidator,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomDropDown(
                                  title: 'Section',
                                  options: sectionList,
                                  selectedOption: section,
                                  onChanged: (newValue1) {
                                    setState(() {
                                      section = newValue1;
                                    });
                                  },
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  formValidator: sectionFormValidator,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.picture_as_pdf_outlined,
                            color: Resource.color.primaryTheme,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Attachment',
                            style: TextStyle(
                              color: Resource.color.primaryTheme,
                              fontWeight: FontWeight.bold,
                              fontFamily: Resource.string.lato,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Resource.color.primaryTheme,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          if (selectedRadio == -1) {
                            var snackBar = SnackBar(
                              content: Text('Please enter all the details'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            _formKey.currentState.save();
                            CustomLoader.getLoader(context);
                            Database.addNotification(
                              title: title,
                              desc: desc,
                              sendTo: selectedRadio,
                              year: year,
                              section: section,
                              attachmentUrl: '',
                              faculty: 'H',
                              dateTime: DateFormat('yyyy-MM-dd/kk:mm')
                                  .format(DateTime.now()),
                              context: context,
                            );
                            MyNavigation().pop(context: context);
                            MyNavigation().pop(context: context);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(
                            15,
                          ),
                          child: Text(
                            Resource.string.ok,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
