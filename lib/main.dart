import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Color(0XFF03071e),
      ),
      home: RegisterScreen(),
    );
  }
}
