// enum TicTacToeMark {
//   x,
//   o,
//   none,
// }

// enum TicTacToeState {
//   xTurn,
//   oTurn,
//   xWon,
//   oWon,
//   tie,
// }

// class MyTicTacToeGame {
//   var board;
//   var turn;
//   MyTicTacToeGame() {
//     turn = TicTacToeState.xTurn;
//     board = new List.filled(
//         3, [TicTacToeMark.none, TicTacToeMark.none, TicTacToeMark.none]);
//   }

//   void xMove(int placeNum) {
//     int row = (placeNum / 9).floor();
//     int column = placeNum - row * 3;
//     board[row][column] = TicTacToeMark.x;
//     checkGame();
//   }

//   void oMove(int placeNum) {
//     int row = (placeNum / 9).floor();
//     int column = placeNum - row * 3;
//     board[row][column] = TicTacToeMark.o;
//     checkGame();
//   }

//   TicTacToeState checkGame() {
//     var boardT = new List.filled(
//         3, [TicTacToeMark.none, TicTacToeMark.none, TicTacToeMark.none]);
//     var boardD = new List.filled(
//         2, [TicTacToeMark.none, TicTacToeMark.none, TicTacToeMark.none]);
//     //make row list: just the board

//     //make column list
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         boardT[i][j] = board[j][i];
//       }
//       //make diagonal list
//       boardD[0] = [board[0][0], board[1][1], board[2][2]];
//       boardD[1] = [board[0][2], board[1][1], board[2][0]];

//       //check row:
//       if (board.contains([TicTacToeMark.x, TicTacToeMark.x, TicTacToeMark.x])) {
//         turn = TicTacToeState.xWon;
//       } else if (board
//           .contains([TicTacToeMark.o, TicTacToeMark.o, TicTacToeMark.o])) {
//         turn = TicTacToeState.oWon;
//       } else if (boardT
//           .contains([TicTacToeMark.x, TicTacToeMark.x, TicTacToeMark.x])) {
//         turn = TicTacToeState.xWon;
//       } else if (boardT
//           .contains([TicTacToeMark.o, TicTacToeMark.o, TicTacToeMark.o])) {
//         turn = TicTacToeState.oWon;
//       } else if (boardD
//           .contains([TicTacToeMark.x, TicTacToeMark.x, TicTacToeMark.x])) {
//         turn = TicTacToeState.xWon;
//       } else if (boardD
//           .contains([TicTacToeMark.o, TicTacToeMark.o, TicTacToeMark.o])) {
//         turn = TicTacToeState.oWon;
//       }
//       //add the tie condition
//     }
//   }
// }

// void main() {
//   print("testing tic tac toe game");
//   //Make a game object
//   //Press the middle square
//   //Somehow print or test if it worked
//   //press another spot
// }
