import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.switchGender});

  final Color colour;
  final Widget cardChild;
  final Function switchGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: switchGender,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

