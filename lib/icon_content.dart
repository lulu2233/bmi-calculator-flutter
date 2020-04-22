import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.label, this.myIcon});//initialize the variables

  final IconData myIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            label, style: kLabelStyle
        )
      ],
    );
  }
}