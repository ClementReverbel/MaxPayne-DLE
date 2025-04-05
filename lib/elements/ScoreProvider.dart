import 'package:flutter/cupertino.dart';

class ScoreProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void augmenterScore() {
    _score++;
    notifyListeners();
  }
}