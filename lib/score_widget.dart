import 'package:flutter/material.dart';

import 'colors.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(this.title, this.score, {Key? key}) : super(key: key);
  final String title;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: buttonColor,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColorWhite,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            score.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
