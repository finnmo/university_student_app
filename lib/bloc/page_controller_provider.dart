import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void navigateToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    notifyListeners();
  }
}