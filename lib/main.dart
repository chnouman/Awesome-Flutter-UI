import 'package:flutter/material.dart';
import 'package:flutteruilogin/v1/signup/RegisterPage.dart';
import 'package:flutteruilogin/v2/LoginPageV2.dart';
import 'package:flutteruilogin/v2/RegisterPageV2.dart';
import 'amtiss/LoginAmitss.dart';
import 'amtiss/LoginPageAmitss.dart';
import 'v1/login/LoginPage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_amtiss',
      // home: LoginPageAmtiss(),
      routes: {
        'login_amtiss': (context) => LoginPageAmtiss(),
        'login_v1': (context) => LoginPage(),
        'register_v1': (context) => RegisterPage(),
        'login_v2': (context) => LoginPageV2(),
        'register_v2': (context) => RegisterPageV2()
      },
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 0, foregroundColor: Colors.white),
          accentColor: Colors.redAccent,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22, color: Colors.redAccent),
              headline2: TextStyle(
                  fontSize: 24,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700),
              bodyText1: TextStyle(fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400)
          )),
    ));
