import 'tic_tac_toe.dart';

class Game { 
  void play() {
    print('Welcome to Tic-Tac-Toe Game!');
    do {
      var ticTacToe = TicTacToe();
      ticTacToe.playGame();
      print('Do you want to play again? [y/n]'); // after finising or restsrt the game 
      var playAgain = stdin.readLineSync()?.toLowerCase(); // y for yes, n for no 
      if (playAgain != 'y') {
        break;
      }
    } while (true);
  }
}
