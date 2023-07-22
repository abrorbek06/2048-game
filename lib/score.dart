import 'package:flutter/material.dart';
import 'package:flutter2048/button_widget.dart';
import 'package:flutter2048/colors.dart';
import 'package:flutter2048/score_widget.dart';

class Score extends StatelessWidget {
  const Score({
    Key? key,
    required this.newGame,
    required this.currentScore,
    required this.undoGame,
  }) : super(key: key);

  final Function newGame;
  final Function undoGame;
  final int currentScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "2048",
            style: TextStyle(
              color: textColor,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ScoreWidget("Score", currentScore),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScoreWidget("Best", 296),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonWidget(
                      onPressed: () {
                        undoGame();
                      },
                      iconData: Icons.restart_alt,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonWidget(
                      onPressed: () {
                        newGame();
                      },
                      iconData: Icons.create_new_folder_rounded,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
