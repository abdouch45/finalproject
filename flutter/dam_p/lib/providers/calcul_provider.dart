import 'package:flutter/material.dart';

class Calc with ChangeNotifier {
  Map<int,double> _finalMarks={};

   get calc => _finalMarks;

  void setMark(int i,double val) {
    if(_finalMarks.containsKey(i)){
      _finalMarks.update(i, (value) => val);}
      else{
      _finalMarks[i]=val;

    }

    notifyListeners();
  }
  void removeMark(int i) {
    _finalMarks.remove(i);

    notifyListeners();
  }



  void reset() {

    _finalMarks.clear();
    notifyListeners();
  }
}