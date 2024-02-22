import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
InputBorder myBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: kTextColor),
    borderRadius: BorderRadius.circular(30),
    gapPadding: 15,
  );
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kConfirmPassNullError = "Please Enter your password again";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kEmailAlreadyInUse = "The account already exists for that email";
const String kUserNotFound = "No user found for that email.";
const String kWrongPass = "Wrong password provided for that user";
const String kErorr = "there was an error";
const String kSignInErorr = "Enter a valid Email and Password";
const String kverifyAccount = "Please verify your account";

const List<Map<String, String>> splashData = [
  {
    "text": "Welcome to Tokoto, Let’s shop!",
    "image": "assets/images/splash_1.png",
  },
  {
    "text": "We help people conect with store \naround United State of America",
    "image": "assets/images/splash_2.png",
  },
  {
    "text": "We show the easy way to shop. \nJust stay at home with us",
    "image": "assets/images/splash_3.png",
  },
];
final InputDecoration otpDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
