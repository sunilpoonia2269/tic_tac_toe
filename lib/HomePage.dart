import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = false;
  String message;
  var playGameCount = 0;

  List<String> gameState;

  // Todo : initlize the state of box with empty

  @override
  void initState() {
    super.initState();

    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // Todo : playGame method

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        playGameCount = playGameCount + 1;
        if (this.isCross) {
          this.gameState[index] = "cross";
          // this.isCross = false;
        } else {
          this.gameState[index] = "circle";
          // this.isCross = true;
        }
        if (playGameCount > 4) {
          this.checkWin();
        }
        this.isCross = !this.isCross;
      });
    }
  }

  // Todo : resetGame method

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
      playGameCount = 0;
    });
  }

  // Todo : getImage method

  getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;

        break;
      case ("cross"):
        return cross;

        break;
      case ("circle"):
        return circle;

        break;
    }
  }

  timer() {
    new Timer(new Duration(seconds: 2), () {
      resetGame();
    });
  }

  // Todo : check for win logic

  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      });
      timer();
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
        timer();
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
      });
      timer();
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      });
      timer();
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';
      });
      timer();
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
      });
      timer();
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
      });
      timer();
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
      });
      timer();
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "game draw";
      });
      timer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(0.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: MaterialButton(
                        onPressed: () {
                          this.playGame(i);
                        },
                        child: Image(
                          image: this.getImage(this.gameState[i]),
                        ),
                      ),
                    )),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              this.resetGame();
            },
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              "Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "LearnCodeOnline.in",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  Text(
                    "A Project By MarcosOP",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
