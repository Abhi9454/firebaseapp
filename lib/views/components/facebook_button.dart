import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const FacebookButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.30,
      height: size.width * 0.12,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00008B),
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor,fontSize: 15),
        ),
      ),
    );
  }
}
