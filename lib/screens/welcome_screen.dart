import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//importing screens
import 'login_screen.dart';
import 'register_screen.dart';
//importing widgets
import '../widgets/rounded_rectangular_btn.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                  ),
                ),
                // TypewriterAnimatedTextKit(
                //   text: ['Flash Chat'],
                //   textStyle: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                // DefaultTextStyle(
                //   style: const TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                //   child: AnimatedTextKit(
                //     animatedTexts: [
                //       TypewriterAnimatedText('Flash Chat'),
                //     ],
                //   ),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: RoundedBtn(
                text: 'Log In',
                colour: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: RoundedBtn(
                text: 'Register',
                colour: Theme.of(context).primaryColor,
                onPressed: () =>
                    Navigator.pushNamed(context, RegisterScreen.id)),
          ),
        ],
      ),
    );
  }
}
