import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';
import 'package:validators/validators.dart';
import '../alert_dialog/alert_dialog.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
const length = 50;
const inputFormTextStyle = TextStyle(color: brandWhite, fontFamily: 'Roboto');

decoration(labeltxt) => InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
    focusColor: brandBlack,
    counterStyle: const TextStyle(
      color: brandWhite,
    ),
    labelText: labeltxt,
    labelStyle: TextStyle(color: brandWhite, fontFamily: 'Lovelo'),
    fillColor: brandWhite,
    hoverColor: brandWhite,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: brandWhite),
    ),
    constraints: BoxConstraints(maxWidth: 350, maxHeight: 100));

class TextContactForm extends StatefulWidget {
  const TextContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<TextContactForm> createState() => _TextContactFormState();
}

class _TextContactFormState extends State<TextContactForm> {
  final _formKey = GlobalKey<FormState>();
  String fName = '',
      lName = '',
      buisnessName = '',
      phone = '',
      email = '',
      projType = '';
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                fName = value!;
              },
              maxLength: length,
              decoration: decoration('First Name'),
              style: inputFormTextStyle),
          TextFormField(
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                lName = value!;
              },
              maxLength: length,
              decoration: decoration('Last Name'),
              style: inputFormTextStyle),
          TextFormField(
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                buisnessName = value!;
              },
              maxLength: length,
              decoration: decoration('Buisness Name'),
              style: inputFormTextStyle),
          TextFormField(
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (isNumeric(value)) {
                    return null;
                  }
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                phone = value!;
              },
              maxLength: length,
              decoration: decoration('Phone'),
              style: inputFormTextStyle),
          TextFormField(
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (isEmail(value)) {
                    return null;
                  }
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                email = value!;
              },
              maxLength: length,
              decoration: decoration('Email'),
              style: inputFormTextStyle),
          TextFormField(
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                projType = value!;
              },
              maxLength: length,
              decoration: decoration('Project Type'),
              style: inputFormTextStyle),
          ElevatedButton(
            //submit button
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(brandBlack)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('valid inputs - saving and resetting state');
                showDialog(
                    context: context,
                    builder: (BuildContext cxt) {
                      return const ShowLoadingAlert(
                        loadingBody: '',
                        loadingHeader: 'Saving results',
                      );
                    });
                _formKey.currentState!.reset();
                FirebaseFirestore.instance
                    .collection("mail")
                    .add({
                      "firstname": fName,
                      "lastname": lName,
                      "buisnessname": buisnessName,
                      "to": '$email;alex@alderautomations.com',
                      "phone": phone,
                      "message": {
                        "subject": "New Message from $fName $lName",
                        "text":
                            "First: $fName\nLast: $lName\nPhone: $phone\nProject: $projType\nBuisness Name: $buisnessName\nSubmitted: $now"
                      },
                      "timestamp": DateTime.now(),
                    })
                    .then((value) => showDialog(
                        context: context,
                        builder: (BuildContext cxt) {
                          return const ShowValidAlert(
                            validHeader: "Success",
                            validBody: "Your request has been saved",
                          );
                        }))
                    .catchError((error) => showDialog(
                        context: context,
                        builder: (BuildContext cxt) {
                          return const ShowValidAlert(
                            validHeader: "Error",
                            validBody:
                                "There was an error with your request\nplease try again later\nor email us at alex@alderautomations.com",
                          );
                        }));
                Navigator.pop(context);
              } else {
                log('invalid inputs');
                showDialog(
                    context: context,
                    builder: (BuildContext cxt) {
                      return const ShowInvalidAlert(
                        invalidHeader: "Error",
                        invalidBody:
                            "Your inputs were invalid\nplease try again\nor email us at alex@alderautomations.com",
                      );
                    });
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: brandWhite),
            ),
          ),
        ],
      ),
    );
  }
}
