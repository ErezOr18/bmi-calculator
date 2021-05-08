import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableColumn extends StatelessWidget {
  final String text;
  final IconData icon;

  const ReusableColumn({@required this.text, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: boxSized,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
