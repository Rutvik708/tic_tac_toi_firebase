import 'package:flutter/material.dart';
enum Turn{
  PlayerOne, PlayerTwo
}
class GameProvider with ChangeNotifier{
  Turn turn = Turn.PlayerOne;
  int position = 1;
  int _scoreOne = 0;
  int _scoreTwo = 0;
  String _mark = '';
  bool _first = true;
  bool _hasEnded = false;
  String _status = '';
  int moves = 0;
  var winingCombination = [];
  var _checkList = [
    '','','',
    '','','',
    '','','',
  ];
  int get playerOneScore => _scoreOne;
  int get playerTwoScore => _scoreTwo;
  String get mark => _mark;
  bool get isFirst => _first;
  bool get isEnd => _hasEnded;
  String get result => _status;
  List<String> get cList => _checkList;

  void setMark(String m){
    _mark = m;
    notifyListeners();
  }
  void setFirst(bool f){
    _first = f;
    notifyListeners();
  }
  void resetGame(){
    _checkList = List.generate(9, (index) => '');
    _hasEnded = false;
    _mark = '';
    _status = '';
    moves = 0;
    winingCombination = [];
    turn = turn == Turn.PlayerOne ? Turn.PlayerTwo : Turn.PlayerOne;
    position = turn == Turn.PlayerOne ? 1 : 2;
    notifyListeners();
  }
  void checkWinner(){
    if(moves > 4){
      if(_checkList[0] == _mark && _checkList[1] == _mark && _checkList[2] == _mark){
        winingCombination = [0,1,2];
        endGame();
        return;
      }
      if(_checkList[3] == _mark && _checkList[4] == _mark && _checkList[5] == _mark){
        winingCombination = [3,4,5];
        endGame();
        return;
      }
      if(_checkList[6] == _mark && _checkList[7] == _mark && _checkList[8] == _mark){
        winingCombination = [6,7,8];
        endGame();
        return;
      }
      if(_checkList[0] == _mark && _checkList[3] == _mark && _checkList[6] == _mark){
        winingCombination = [0,3,6];
        endGame();
        return;
      }
      if(_checkList[1] == _mark && _checkList[4] == _mark && _checkList[7] == _mark){
        winingCombination = [1,4,7];
        endGame();
        return;
      }
      if(_checkList[2] == _mark && _checkList[5] == _mark && _checkList[8] == _mark){
        winingCombination = [2,5,8];
        endGame();
        return;
      }
      if(_checkList[0] == _mark && _checkList[4] == _mark && _checkList[8] == _mark){
        winingCombination = [0,4,8];
        endGame();
        return;
      }
      if(_checkList[2] == _mark && _checkList[4] == _mark && _checkList[6] == _mark){
        winingCombination = [2,4,6];
        endGame();
        return;
      }
      if(moves == 9 && _hasEnded == false){
        _status = 'Match Drawn :(';
        _hasEnded = true;
        notifyListeners();
      }
    }
  }
  void endGame(){
    if(_mark == 'X'){
      if(turn == Turn.PlayerOne){
        _status = 'Player One Wins!!!';
        _scoreOne++;
      }else{
        _status = 'Player Two Wins!!!';
        _scoreTwo++;
      }
    }else{
      if(turn == Turn.PlayerOne){
        _status = 'Player Two Wins!!!';
        _scoreTwo++;
      }else{
        _status = 'Player One Wins!!!';
        _scoreOne++;
      }
    }
    _hasEnded = true;
    notifyListeners();
  }
}