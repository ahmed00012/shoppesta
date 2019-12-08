import 'package:flutter/material.dart';

import 'package:shoppesta/pages/login.dart';

import 'auth/authintcation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SignInPage(),
    );
  }
}