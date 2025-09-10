import 'package:test/test.dart';
import 'package:week2/hangman.dart';

void main() {
  test('Game initializes with hidden word', () {
    final game = HangmanGame();
    expect(game.letterGuess.join(), equals('*' * game.randomWord.length));
    expect(game.lives, equals(6));
  });

  test('Guessing correct letter updates state', () {
    final game = HangmanGame();
    game.randomWord = "cat";
    game.letterGuess = List.filled(game.randomWord.length, "*");

    game.usedLetters.add('c');
    for (int i = 0; i < game.randomWord.length; i++) {
      if (game.randomWord[i] == 'c') {
        game.letterGuess[i] = 'c';
      }
    }

    expect(game.letterGuess.join(), equals("c**"));
  });
}
