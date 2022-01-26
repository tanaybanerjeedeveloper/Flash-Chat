import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'chat_screen.dart';
import '../widgets/rounded_rectangular_btn.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;
  var _showSpinner = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/images/logo.png'),
                  height: 200.0,
                ),
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
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    setState(() {
                      _showSpinner = false;
                    });
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
      ),
    );
  }
}
