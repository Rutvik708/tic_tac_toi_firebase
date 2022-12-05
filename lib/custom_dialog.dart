import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_button.dart';

class GridItem extends StatefulWidget {
  final int index;

  const GridItem({Key? key, required this.index}) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  late GameProvider gameProvider;

  @override
  didChangeDependencies(){
    gameProvider = Provider.of<GameProvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!gameProvider.isEnd && gameProvider.cList[widget.index].isEmpty){
          setState((){
            gameProvider.moves +=1;
            gameProvider.cList[widget.index] = gameProvider.isFirst ? 'X' : 'O';
            gameProvider.setMark(gameProvider.isFirst ? 'X' : 'O');
            gameProvider.position = gameProvider.position == 1 ? 2 : 1;
            gameProvider.setFirst(!gameProvider.isFirst);
          });
          gameProvider.checkWinner();
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: gameProvider.winingCombination.contains(widget.index)?Colors.red:Colors.blue.shade700,
        child: Text(gameProvider.cList[widget.index],style: TextStyle(fontSize: 40, color: Colors.white),),
      ),
    );
  }
}