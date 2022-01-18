import 'package:flutter/material.dart';
//importing screens
import 'chat_screen.dart';
//importing widgets
import '../widgets/rounded_rectangular_btn.dart';
//importing constants
import '../constants.dart';
//importing firebase
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('assets/images/logo.png'),
              height: 200.0,
            ),
          ),
          SizedBox(height: 28.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            // child: TextFieldWidget(
            //   hintText: 'Enter your email',
            // ),
            child: TextField(
              onChanged: (value) {
                _email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            // child: TextFieldWidget(
            //   hintText: 'Enter your password',
            // ),
            child: TextField(
              onChanged: (value) {
                _password = value;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            child: RoundedBtn(
              text: 'Register',
              colour: Theme.of(context).primaryColor,
              onPressed: () async {
                try {
                  final user = await _auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
