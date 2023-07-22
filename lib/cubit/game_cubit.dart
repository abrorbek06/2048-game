import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState([], 0));
  List<List<int>> board =
      List.generate(4, (index) => List.generate(4, (index) => 0));
  int score = 0;
  List<List<int>> undo = [];

  initBoard() {
    int count = 0;
    while (count < 2) {
      Random random = Random();
      int i = random.nextInt(4);
      int j = random.nextInt(4);
      board[i][j] = 2;
      count++;
    }
    emit(GameState(board, score));
  }

  void moveLeft() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        for (int k = j + 1; k < board.length; k++) {
          if (board[i][k] != 0) {
            if (board[i][j] == 0) {
              board[i][j] = board[i][k];
              board[i][k] = 0;
              j--;
              break;
            } else if (board[i][j] == board[i][k]) {
              board[i][j] *= 2;
              score += board[i][j];
              board[i][k] = 0;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
  }

  void moveRight() {
    for (int i = 0; i < board.length; i++) {
      for (int j = board.length - 1; j >= 0; j--) {
        for (int k = j - 1; k >= 0; k--) {
          if (board[i][k] != 0) {
            if (board[i][j] == 0) {
              board[i][j] = board[i][k];
              board[i][k] = 0;
              j++;
              break;
            } else if (board[i][j] == board[i][k]) {
              board[i][j] *= 2;
              score += board[i][j];
              board[i][k] = 0;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
  }

  void moveUp() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        for (int k = j + 1; k < board.length; k++) {
          if (board[k][i] != 0) {
            if (board[j][i] == 0) {
              board[j][i] = board[k][i];
              board[k][i] = 0;
              j--;
              break;
            } else if (board[j][i] == board[k][i]) {
              board[j][i] *= 2;
              score += board[j][i];
              board[k][i] = 0;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
  }

  void moveDown() {
    for (int i = 0; i < board.length; i++) {
      for (int j = board.length - 1; j >= 0; j--) {
        for (int k = j - 1; k >= 0; k--) {
          if (board[k][i] != 0) {
            if (board[j][i] == 0) {
              board[j][i] = board[k][i];
              board[k][i] = 0;
              j++;
              break;
            } else if (board[j][i] == board[k][i]) {
              board[j][i] *= 2;
              score += board[j][i];
              board[k][i] = 0;
              break;
            } else {
              break;
            }
          }
        }
      }
    }
  }

  onMove(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.left:
        moveLeft();
        break;
      case SwipeDirection.right:
        moveRight();
        break;
      case SwipeDirection.up:
        moveUp();
        break;
      case SwipeDirection.down:
        moveDown();
        break;
    }
    generateItem();
  }

  void generateItem() {
    undo = [...board];
    int count = 0;
    while (count < 1) {
      Random random = Random();
      int i = random.nextInt(4);
      int j = random.nextInt(4);
      if (board[i][j] == 0) {
        board[i][j] = 2;
        count++;
      }
    }
    emit(GameState(board, score));
  }

  newGame() {
    board = List.generate(
      4,
      (index) => List.generate(4, (index) => 0),
    );
    score = 0;
    initBoard();
  }

  bool isGameOver() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; i++) {
        if (board[i][j] == 0) {
          return false;
        }
        if (j < 3 && board[i][j] == board[i][j + 1]) {
          return false;
        }
        if (i < 3 && board[i][j] == board[i + 1][j]) {
          return false;
        }
      }
    }

    return true;
  }
}
