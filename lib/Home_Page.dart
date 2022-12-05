import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_dialog.dart';
import 'game_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        actions: [
          Consumer<GameProvider>(
            builder: (context, provider,child) => IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                provider.setFirst(true);
                provider.resetGame();
              },
            ),
          )
        ],
      ),
      body: Consumer<GameProvider>(
        builder:(context,provider,child) => Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(50.0),
                width: 300,
                height: 300,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: List.generate(9, (index) => GridItem(index: index)),
                ),
              ),
            ),
            Divider(color: Colors.black),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(provider.turn == Turn.PlayerOne ? 'Player One is X' : 'Player Two is X', style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Divider(color: Colors.black),
                  Row(
                    children: [
                      Icon(Icons.play_arrow,color: provider.position == 1 ? Colors.black:Colors.white,),
                      SizedBox(width: 5,),
                      Text('Player One: ',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 10,),
                      Text('${provider.playerOneScore}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.play_arrow,color:provider.position == 2 ? Colors.black :Colors.white,),
                      SizedBox(width: 5,),
                      Text('Player Two: ',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 10,),
                      Text('${provider.playerTwoScore}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(provider.result,style: TextStyle(fontSize: 30),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}