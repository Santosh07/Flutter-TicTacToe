import 'package:flutter/material.dart';
import 'package:tic_tac_toe/custom_dialog.dart';
import 'package:tic_tac_toe/game_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GameButton> gameButtons;

  List<int> player1;
  List<int> player2;
  int activePlayer;

  @override
  void initState() {
    super.initState();

    player1 = List();
    player2 = List();
    activePlayer = 1;

    gameButtons = generateNewButtons();
  }

  List<GameButton> generateNewButtons() {
    return <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
  }

  void playGame(GameButton gb) {
    setState(() {
      gb.enabled = false;
      if (activePlayer == 1) {
        gb.bg = Colors.red;
        gb.text = "X";
        activePlayer = 2;
        player1.add(gb.id);
      } else if (activePlayer == 2) {
        gb.bg = Colors.black;
        gb.text = "O";
        player2.add(gb.id);
        activePlayer = 1;
      }
      checkWinner();
    });
  }

  void checkWinner() {
    String content = "Press the reset button to start again";

    if (processWinLogicForPlayer(player1)) {
      showWonDialog("Player 1 won", content, resetGame);
    } else if (processWinLogicForPlayer(player2)) {
      showWonDialog("Player 2 won", content, resetGame);
    }
  }

  void showWonDialog(String title, String content, VoidCallback resetGame) {
    showDialog(
        context: context,
        builder: (_) => CustomDialog(title, content, resetGame));
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    player1.clear();
    player2.clear();
    activePlayer = 1;
    setState(() {
      gameButtons = generateNewButtons();
    });
  }

  bool processWinLogicForPlayer(List<int> player) {
    var result = false;
    if (player.contains(1) && player.contains(2) && player.contains(3) ||
        player.contains(4) && player.contains(5) && player.contains(6) ||
        player.contains(7) && player.contains(8) && player.contains(9) ||
        player.contains(1) && player.contains(4) && player.contains(7) ||
        player.contains(2) && player.contains(5) && player.contains(8) ||
        player.contains(3) && player.contains(6) && player.contains(9) ||
        player.contains(1) && player.contains(5) && player.contains(9) ||
        player.contains(3) && player.contains(5) && player.contains(7)) {
      result = true;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tic Tac Toe'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                          child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8),
                itemCount: gameButtons.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,                  
                      child: RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        onPressed: gameButtons[i].enabled
                            ? () => playGame(gameButtons[i])
                            : null,
                        color: gameButtons[i].bg,
                        disabledColor: gameButtons[i].bg,
                        child: Text(
                          gameButtons[i].text,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
              ),
            ),
            RaisedButton(                            
              padding: const EdgeInsets.all(16.0),
              child: Text("RESET", style: TextStyle(color: Colors.white, fontSize: 20),),
              onPressed: resetGame,
              color: Colors.red,
            )
          ],
        ));
  }
}
