import 'package:flutter/material.dart';
import 'package:suc_khoe_app/constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({ required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 0.0),
        padding: EdgeInsets.only(bottom: 0.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
