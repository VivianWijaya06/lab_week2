import 'dart:io';
import 'dart:math';

class HangmanGame {
  final List<String> words = [
    "banana",
    "ear",
    "apple",
    "blue",
    "destruction",
    "security",
    "cat",
  ];

  late String randomWord;
  late List<String> letterGuess;
  List<String> usedLetters = [];
  int lives = 6;

  HangmanGame() {
    final random = Random();
    randomWord = words[random.nextInt(words.length)];
    letterGuess = List.filled(randomWord.length, "*");
  }

  void start() {
    print("=== Welcome to Hangman ===");
    print("Let's start playing!\n");

    while (lives > 0 && letterGuess.join() != randomWord) {
      print("Word: ${letterGuess.join(" ")}");
      print("Used letters: ${usedLetters.join(", ")}");
      print("Lives left: $lives");

      stdout.write("Enter a letter: ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Please enter something!\n");
        continue;
      }
      if (input.length != 1) {
        print("Please enter only one letter!\n");
        continue;
      }

      String guess = input.toLowerCase();

      if (usedLetters.contains(guess)) {
        print("You already used '$guess'. Try another.\n");
        continue;
      }

      usedLetters.add(guess);

      if (randomWord.contains(guess)) {
        for (int i = 0; i < randomWord.length; i++) {
          if (randomWord[i] == guess) {
            letterGuess[i] = guess;
          }
        }
        print("Correct guess!\n");
      } else {
        lives--;
        print("Wrong guess! You lost 1 life.\n");
      }
    }

    if (letterGuess.join() == randomWord) {
      print("Well done! The word was: $randomWord");
    } else {
      print("No more lives. You lost!");
      print("The word was: $randomWord");
    }
  }
}
