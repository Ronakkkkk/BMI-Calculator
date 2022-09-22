import 'package:flutter/material.dart';
import 'constants.dart';

class Customicon extends StatelessWidget {
  Customicon({this.icon, this.text});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text, style: ksmalltextstyle)
      ],
    );
  }
}
