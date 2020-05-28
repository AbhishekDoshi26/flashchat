import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

showAlertDialog(BuildContext context, String text, String buttonText) {
  if (text ==
      'PlatformException(ERROR_USER_NOT_FOUND, There is no user record corresponding to this identifier. The user may have been deleted., null)')
    text = 'User not registered!!';
  else if (text ==
      'PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)')
    text = 'Invalid Email Id. Email Address is not correctly formated';
  else if (text ==
          '\'package:firebase_auth/src/firebase_auth.dart\': Failed assertion: line 174 pos 12: \'email != null\': is not true.' ||
      text ==
          "'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 61 pos 12: 'email != null': is not true.")
    text = 'Email can\'t be empty!!';
  else if (text ==
          "'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 175 pos 12: 'password != null': is not true." ||
      text ==
          "'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 62 pos 12: 'password != null': is not true.")
    text = 'Password can\'t be empty!!';
  else if (text ==
      "PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)")
    text = 'Email Address already registered!! \nPlease Login to continue.';
  else
    text = 'Sorry! Some unexpected error occured. \n Please try again later. ';
  AlertDialog alert = AlertDialog(
    title: Row(
      children: <Widget>[
        Text(
          "Snap!!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        Text(
          "\t ❌",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
      ],
    ),
    content: Text(
      "Oops!  $text",
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.tealAccent.shade400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    actions: [
      FlatButton(
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
