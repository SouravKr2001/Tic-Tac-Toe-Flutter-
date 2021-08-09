import 'package:flut_tic_tac_toe_game_mtv31/game_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit(){
    List<int> player1 = [];
    List<int> player2 = [];
    // List<int> player1 = List.filled(1, 0, growable: true);
    // player1=new List();
    // player2=new List();
    activePlayer= 1;

    var gameButtons = <GameButton>[
      new GameButton(id:1),
      new GameButton(id:2),
      new GameButton(id:3),
      new GameButton(id:4),
      new GameButton(id:5),
      new GameButton(id:6),
      new GameButton(id:7),
      new GameButton(id:8),
      new GameButton(id:9),

    ];
    return gameButtons;
  }

  void playGame(GameButton gb){
    setState(() {
      if(activePlayer  == 1){
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      }else{
        gb.text = "0";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
          itemCount: buttonsList.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9
          ),
          itemBuilder: (context,i)=> new SizedBox(
            width: 100,
            height: 100,
            child: RaisedButton(
              padding: EdgeInsets.all(8),
              onPressed: buttonsList[i].enabled?()=>playGame(buttonsList[i]):null,
              child: Text(buttonsList[i].text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              color: buttonsList[i].bg,
              disabledColor: buttonsList[i].bg,
            ),
          )
      )
    );
  }
}
