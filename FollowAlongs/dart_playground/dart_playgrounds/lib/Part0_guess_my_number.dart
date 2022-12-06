import 'dart:io';
import 'dart:math';

void main() {
  print("Welcome to guess my number!");
  //how to get a random number from 1 to 100
  Random random = new Random();
  int randomNumber = random.nextInt(101);
  print(randomNumber);
  // start a guess counter at 0
  int count = 0;
  int num = 0;
  //indefinate while loop
  do {
    count++;
    print("Please input your guess of the number: ");
    num = int.parse(stdin.readLineSync()!);
    if (num < randomNumber) {
      print("Too small");
    }
    if (num > randomNumber) {
      print("Too large");
    }

    if (num == randomNumber) {
      print("Correct! You use $count guesses.");
    }
  } while (num != randomNumber);

  // prompt the user for a guess from the console
  // increment our counter
  // if too high v the secret number say too high
  // if top low vs the secret number say too low
  // if correct exit the while loop

  // congratulate the user and say the number of guesses needed
}
