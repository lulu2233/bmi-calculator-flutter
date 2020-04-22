import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.cal});
  final Function onPress;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(cal, style: kLargeTextStyle,) ),
        color: kBottomBoxColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomHeight,
      ),
    );
  }
}