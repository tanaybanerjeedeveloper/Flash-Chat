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
        primaryColor: Color(0xff4361ee),
        accentColor: Color(0xff4895ef),
        scaffoldBackgroundColor: Color(0XFF03071e),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
