import 'package:flutter/material.dart';

import 'colors.dart';

class TableBackground extends StatelessWidget {
  const TableBackground({Key? key, required this.board}) : super(key: key);
  final List<List<int>> board;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.shortestSide * 0.9;
    var tileSize = (size / 4).ceil().toDouble();
    var boardSize = tileSize * 4.0;
    var tiles = tileSize - 12 - 3;
    return Container(
      width: boardSize,
      height: boardSize,
      decoration: BoxDecoration(
        color: boardColor,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Stack(children: [
        ...List.generate(
          16,
          (index) {
            int y = ((index + 1) / 4).ceil();

            var top = y * 12 + tiles * (y - 1);
            var left = (index % 4 + 1) * 12 + tiles * (index % 4);

            return Positioned(
              top: top,
              left: left,
              child: Container(
                height: tiles,
                width: tiles,
                decoration: BoxDecoration(
                  color: emptyTileColor,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            );
          },
        ),
        ...List.generate(
          16,
          (index) {
            int y = ((index + 1) / 4).ceil();

            var top = y * 12 + tiles * (y - 1);
            var left = (index % 4 + 1) * 12 + tiles * (index % 4);

            return Positioned(
              top: top,
              left: left,
              child: Container(
                height: tiles,
                width: tiles,
                decoration: BoxDecoration(
                  color: tileColors[board[y - 1][(index % 4)]],
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Center(
                  child: Text(
                    board[y - 1][(index % 4)] == 0
                        ? ""
                        : board[y - 1][(index % 4)].toString(),
                    style: TextStyle(
                      color: board[y - 1][(index % 4)] <= 8
                          ? textColor
                          : textColorWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
