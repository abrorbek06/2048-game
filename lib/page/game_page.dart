import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter2048/colors.dart';
import 'package:flutter2048/cubit/game_cubit.dart';
import 'package:flutter2048/score.dart';
import 'package:flutter2048/table_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // / List<List<int>> undo = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocProvider(
        create: (context) => GameCubit()..initBoard(),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            return SwipeDetector(
              onSwipe: (direction, offset) {
                print(direction);
                context.read<GameCubit>().onMove(direction);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Score(
                    undoGame: () {
                      // setState(() {
                      //   board = undo;
                      // });
                    },
                    newGame: () {
                      context.read<GameCubit>().newGame();
                    },
                    currentScore: state.score,
                  ),
                  TableBackground(
                    board: state.board,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
