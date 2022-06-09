import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier{
  String _searchText = '';
  String get searchText => _searchText;
  bool isLoading = false;
  int calenderFilter = 0;

  void search(String text){
    _searchText = text;
    //notifyListeners();
  }

  void setCalenderFilter(int position){
    calenderFilter = position;
    notifyListeners();
  }

  void setIsLoading(){
    isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 1000),(){
      isLoading = false;
      notifyListeners();
    });
  }

}