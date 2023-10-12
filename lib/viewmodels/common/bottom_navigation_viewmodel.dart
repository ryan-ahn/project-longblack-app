import 'package:flutter/material.dart';

class BottomNavigationViewmodel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}