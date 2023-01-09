import 'dart:math';
import 'package:test/test.dart';

enum LightsMark {
  on,
  off,
}

enum LightsState {
  allOn,
  allOff,
  inGame,
}

// void main() {
//   LinearLightsOutGame game = new LinearLightsOutGame();
//   print(game.board);
// }

//randomly piuck a light mark, used for initialization
LightsMark get randomMark {
  int mark = new Random().nextInt(LightsMark.values.length);
  return LightsMark.values[mark];
}

class LinearLightsOutGame {
  int pressCount = 0;
  LightsState state = LightsState.inGame;
  late List<LightsMark> board = [
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark,
    randomMark
  ];

  void Lightswitch(int index) {
    if (board[index] == LightsMark.on) {
      board[index] = LightsMark.off;
    } else {
      board[index] = LightsMark.on;
    }
  }

  void pressLight(int index) {
    if ((state == LightsState.allOff)) {
      print("Game end");
      return;
    }
    //if index is 0:
    if (index == 0) {
      Lightswitch(0);
      Lightswitch(1);
    } else if (index == 12) {
      Lightswitch(12);
      Lightswitch(11);
    } else {
      Lightswitch(index);
      Lightswitch(index + 1);
      Lightswitch(index - 1);
    }
    pressCount = pressCount + 1;
  }

  void checkEnd() {
    if (checkAllOff() == true) {
      state = LightsState.allOff;
    } else if (checkAllOn() == true) {
      state = LightsState.allOn;
    } else {
      state = LightsState.inGame;
    }
  }

  bool checkAllOn() {
    for (int i = 0; i < 13; i++) {
      if (board[i] == LightsMark.off) {
        return false;
      }
    }
    return true;
  }

  bool checkAllOff() {
    for (int i = 0; i < 13; i++) {
      if (board[i] == LightsMark.on) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  LinearLightsOutGame game = new LinearLightsOutGame();
  game.board = [
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.off,
    LightsMark.on,
    LightsMark.on,
    LightsMark.on
  ];

  test('Initial game board', () {
    expect(game.state, equals(LightsState.inGame));
    expect(game.board.length, equals(13));
    expect(
        game.board[0],
        equals(
          LightsMark.off,
        ));
    expect(game.board[12], equals(LightsMark.on));
  });

  test('Press Button 11', () {
    game.pressLight(11);
    expect(game.state, equals(LightsState.allOff));
    expect(game.board[12], equals(LightsMark.off));
  });
}
