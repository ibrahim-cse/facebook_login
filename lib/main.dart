import 'package:facebook_login/screens/fb_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Camera',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: FacebookLogin(),
    );
  }
}
