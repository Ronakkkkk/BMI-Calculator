import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  BottomButton({this.text, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        height: 80,
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
      ),
    );
  }
}
