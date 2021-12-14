import 'package:suc_khoe_app/constant.dart';
import 'package:flutter/material.dart';

class TinhThanh extends StatelessWidget {
  final String? number1;
  final Color? color1;
  final String? title1;
  const TinhThanh({
    Key? key,
    this.title1,
    this.color1,
    this.number1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "$number1",
          style: TextStyle(
            fontSize: 15,
            color: color1,
          ),
        ),Text(title1!, style: kSubTextStyle),
      ],
    );
  }
}


