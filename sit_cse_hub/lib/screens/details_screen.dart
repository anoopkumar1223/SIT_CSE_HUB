import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sit_cse_hub/components/custom_dropdown.dart';
import 'package:sit_cse_hub/resources/resource.dart';
import 'package:sit_cse_hub/components/custom_textfield.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController nameController;
  TextEditingController usnController;
  TextEditingController yearController;
  TextEditingController phoneController;
  String firstName;
  String lastName;
  String usn;
  String phone;
  String valueYear;
  String valueSec;
  List<String> yearList = ['I Year', 'II Year', 'III Year', 'IV Year'];
  List<String> sectionList = ['A Section', 'B Section', 'C Section'];
  final _formKey = GlobalKey<FormState>();
  FocusNode node = FocusNode();

  Function firstNameValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    return null;
  };

  Function lastNameValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    return null;
  };

  Function usnValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    return null;
  };

  Function phoneValidator = (String value) {
    if (value.isEmpty) return Resource.string.required;
    if (value.length != 10) return 'Please enter a valid phone number';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(node);
      },
      child: Scaffold(
        backgroundColor: Resource.color.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      Resource.string.tellUsABit,
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontFamily: Resource.string.bangers,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            Resource.string.enterYour,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: Resource.string.lato,
                            ),
                          ),
                          Text(
                            Resource.string.details,
                            style: TextStyle(
                              fontSize: 27.0,
                              fontWeight: FontWeight.w900,
                              fontFamily: Resource.string.lato,
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset(
                        Resource.image.detailsGif,
                        height: 250,
                        width: 200,
                      ),
                    ],
                  ),
                  ClayContainer(
                    spread: 3,
                    depth: 20,
                    borderRadius: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset(
                          Resource.image.profileGif,
                          height: 150,
                          width: 150,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Select profile image'),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Resource.color.primaryTheme,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 15,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Resource.color.whiteColor,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          title: Resource.string.firstName,
                          hintText: Resource.string.john,
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: firstNameValidator,
                          onSaved: (value) {
                            firstName = value;
                          },
                          isObscure: false,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          title: Resource.string.lastName,
                          hintText: Resource.string.ca,
                          keyboardType: TextInputType.text,
                          controller: yearController,
                          validator: lastNameValidator,
                          onSaved: (value) {
                            lastName = value;
                          },
                          isObscure: false,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          title: Resource.string.detailsUsn,
                          hintText: Resource.string.john1,
                          keyboardType: TextInputType.text,
                          controller: usnController,
                          validator: usnValidator,
                          onSaved: (value) {
                            usn = value;
                          },
                          isObscure: false,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          title: Resource.string.num,
                          hintText: Resource.string.phoneNum,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: phoneValidator,
                          onSaved: (value) {
                            phone = value;
                          },
                          isObscure: false,
                          onFieldSubmitted: (a) =>
                              FocusScope.of(context).unfocus(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomDropDown(
                              title: 'Year',
                              options: yearList,
                              selectedOption: valueYear,
                              onChanged: (newValue1) {
                                setState(() {
                                  valueYear = newValue1;
                                });
                              },
                              width: MediaQuery.of(context).size.width / 2.2,
                              formValidator: yearFormValidator,
                            ),
                            CustomDropDown(
                              title: 'Section',
                              options: sectionList,
                              selectedOption: valueSec,
                              onChanged: (newValue1) {
                                setState(() {
                                  valueSec = newValue1;
                                });
                              },
                              width: MediaQuery.of(context).size.width / 2.2,
                              formValidator: sectionFormValidator,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Resource.color.primaryTheme,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            print(valueYear);
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              child: Text(
                                Resource.string.submit,
                                style: TextStyle(
                                  fontFamily: Resource.string.lato,
                                  fontSize: 17,
                                  color: Resource.color.backgroundColor,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
