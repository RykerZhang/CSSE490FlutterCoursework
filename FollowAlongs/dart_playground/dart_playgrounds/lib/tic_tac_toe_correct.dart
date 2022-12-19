import 'package:test/test.dart';

enum TicTacToeMark {
  x,
  o,
  none,
}

enum TicTacToeState {
  xTurn,
  oTurn,
  xWon,
  oWon,
  tie,
}

class TicTacToeGame {
  TicTacToeState state = TicTacToeState.xTurn;
  final List<TicTacToeMark> board =
      List<TicTacToeMark>.filled(9, TicTacToeMark.none);

  void pressedSquare(int index) {
    if (board[index] != TicTacToeMark.none) {
      print("This spot is not empty.");
    }

    if (state == TicTacToeState.xTurn) {
      board[index] = TicTacToeMark.x;
      state = TicTacToeState.oTurn;
      checkForGameOver();
    } else if (state == TicTacToeState.oTurn) {
      board[index] = TicTacToeMark.o;
      state = TicTacToeState.xTurn;
      checkForGameOver();
    } else {
      print('Game over. Ignore the press');
    }
  }

  void checkForGameOver() {
    if (!board.contains(TicTacToeMark.none)) {
      state = TicTacToeState.tie;
    }
    final linesOf3 = <String>[];
    final bs = boardString;
    linesOf3.add(bs[0] + bs[1] + bs[2]);
    linesOf3.add(bs[3] + bs[4] + bs[5]);
    linesOf3.add(bs[6] + bs[7] + bs[8]);
    linesOf3.add(bs[0] + bs[3] + bs[6]);
    linesOf3.add(bs[1] + bs[4] + bs[7]);
    linesOf3.add(bs[2] + bs[5] + bs[8]);
    linesOf3.add(bs[0] + bs[4] + bs[8]);
    linesOf3.add(bs[6] + bs[4] + bs[2]);
    for (final lineOf3 in linesOf3) {
      if (lineOf3 == "XXX") {
        state = TicTacToeState.xWon;
      } else if (lineOf3 == "OOO") {
        state = TicTacToeState.oWon;
      }
    }
  }

  String get stateString => state.toString().split('.').last;

  String get boardString {
    String b = '';
    for (final mark in board) {
      b += (mark == TicTacToeMark.x)
          ? "X"
          : ((mark == TicTacToeMark.o) ? "O" : "-");
    }
    return b;
  }

  @override
  String toString() {
    return '$stateString $boardString';
  }
}

void devUnitTest() {
  var game = TicTacToeGame();
  test('String.split() splits the string on the delimiter', () {
    expect(game.state, equals(TicTacToeState.xTurn));
    expect(game.board.length, equals(9));
    expect(game.board[0], equals(TicTacToeMark.none));
    expect(game.board[4], equals(TicTacToeMark.none));
  });

  test('Single X Press', () {
    game.pressedSquare(4);
    expect(game.state, equals(TicTacToeState.xTurn));
  });
}

void main() {
  print('Testing Tictactoe game');
  devWithPrint();
}

void devWithPrint() {
  var game = TicTacToeGame();
  //print(game.state);
  //print(game.board);
  print('xTurn ---------- $game');
  game.pressedSquare(4);
  print("OTurn ----X---- $game");
  game.pressedSquare(0);
  print("Xturn O---X---- $game");
}
