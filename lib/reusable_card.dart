import 'package:flutter/cupertino.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onTap;

  const ReusableCard({@required this.color, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(cardMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          color: this.color,
        ),
      ),
    );
  }
}
