import 'package:flutter/material.dart';

import 'colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.onPressed, required this.iconData})
      : super(key: key);
  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
