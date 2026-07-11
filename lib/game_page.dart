import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;

  int xScore = 0;
  int oScore = 0;
  int draws = 0;

  void _resetScores() {
    setState(() {
      xScore = 0;
      oScore = 0;
      draws = 0;
    });
  }

  void _handleTap(int index) {
    if (board[index] != '') return;

    setState(() {
      board[index] = xTurn ? 'X' : 'O';
      xTurn = !xTurn;
    });

    _checkWinner();
  }

  void _checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var condition in winConditions) {
      String a = board[condition[0]];
      String b = board[condition[1]];
      String c = board[condition[2]];

      if (a != '' && a == b && b == c) {
        setState(() {
          if (a == 'X') xScore++;
          if (a == 'O') oScore++;
        });
        _showResultDialog('$a wins!');
        return;
      }
    }

    if (!board.contains('')) {
      setState(() {
        draws++;
      });
      _showResultDialog('It\'s a Draw!');
    }
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(message, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            child: Text('Play Again', style: TextStyle(color: Colors.cyan)),
            onPressed: () {
              Navigator.of(context).pop();
              _resetGame();
            },
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      xTurn = true;
    });
  }

  Widget _buildScoreBox(String label, int score, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 20, color: color)),
        SizedBox(height: 5),
        Text('$score',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildScoreBox('X', xScore, Colors.cyan),
                  _buildScoreBox('Draws', draws, Colors.grey),
                  _buildScoreBox('O', oScore, Colors.pinkAccent),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _handleTap(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            board[index],
                            style: TextStyle(
                              color: board[index] == 'X'
                                  ? Colors.cyan
                                  : Colors.pinkAccent,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: _resetScores,
                child: Text('Reset Scores', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
    );
  }
}
