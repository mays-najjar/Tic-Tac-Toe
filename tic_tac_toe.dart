import 'dart:io';

class TicTacToe {
  List<List<String>> board; // 2D list to present 3*3 grid board
  String currentPlayer;

  TicTacToe() : board = List.generate(3, (_) => List<String>.filled(3, ' ')), currentPlayer = 'X'; // first intialaize of this class 3*3 grid, and the player is X

  void printBoard() {
    for (var i = 0; i < 3; i++) {  // iterate each row 
      for (var j = 0; j < 3; j++) {   // iterate each column in each row 
        stdout.write('${board[i][j]}');  // the value of the position it will be 'X' || 'O' || ' ' 
        if (j < 2) {
          stdout.write(' | ');  // for readable board print | after each column except the last one
        }
      }
      print(''); 
      if (i < 2) {  // for readable board print | after each row except the last one
        print('---------');
      }
    }
    print('');
  }
  bool makeMove(int move) {
    if (move < 1 || move > 9) {
      print('Invalid move. Please enter a number between 1 and 9.');
      return false;
    }

    int row = (move - 1) ~/ 3;  // to get the right position in grid 3*3 grid, move - 1 because we want start from 0 not 1, the row will be the division of 3, must be integer so we use ~/
    int col = (move - 1) % 3; // also the column will be the remain division of 3

    if (board[row][col] != ' ') { // the position must be empty and not played before
      print('Invalid move. Cell already occupied. Please enter a valid move.');
      return false;
    }

    board[row][col] = currentPlayer;  // save the position with its player 
    return true;
  }

  bool checkForWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer) {
        return true;  // check rows
      }
      if (board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer) {
        return true;  // check columns
      }
    }

    if (board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer) {
      return true;  // check top-left to bottom-right diagonal
    }
    if (board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer) {
      return true;  // check top-right to bottom-left diagonal
    }

    return false;
  }

  bool isBoardFull() {
    for (var row in board) {  // iterate each row in the 2D list to check if there is an empty position
      if (row.contains(' ')) { 
        return false;
      }
    }
    return true;
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }
 // lets make the rules with each other to get the whole game 
  
  void playGame() {
    int move;

    do {
      printBoard();  // starting with printing the board 

      print('you are the player $currentPlayer, please enter your move: ');
      try {
        move = int.parse(stdin.readLineSync()!); // take the input from user and check if it is an integer 
      } catch (e) {
        print('Invalid input. Please enter a valid move.'); 
        continue;
      }

      if (makeMove(move)) {
        if (checkForWin()) {
          printBoard();
          print('Player $currentPlayer wins!'); 
          break;
        }

        if (isBoardFull()) {
          printBoard();
          print('It\'s a draw!');
          break;
        }

        switchPlayer(); // no winner, board not full so switch 
      }
    } while (true); // all of these functions will looping while the play not finished, notice that game finishs if there is a winner or the board is full 
  }

}
