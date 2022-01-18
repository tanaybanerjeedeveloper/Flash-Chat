import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final String text;
  final Color colour;
  final Function onPressed;
  RoundedBtn({@required this.text, @required this.colour, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
