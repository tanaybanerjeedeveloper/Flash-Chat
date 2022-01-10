import 'package:flutter/material.dart';
//importing widgets
import '../widgets/text_field.dart';
import '../widgets/rounded_rectangular_btn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Image.asset('assets/images/logo.png'),
            height: 200.0,
          ),
          SizedBox(height: 28.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: TextFieldWidget(
              hintText: 'Enter your email',
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: TextFieldWidget(
              hintText: 'Enter your password',
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: RoundedBtn(
                text: 'Log In', colour: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
