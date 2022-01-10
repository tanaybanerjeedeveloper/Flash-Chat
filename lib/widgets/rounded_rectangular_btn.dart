import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final String text;
  final Color colour;
  RoundedBtn({@required this.text, @required this.colour});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: colour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }
}
