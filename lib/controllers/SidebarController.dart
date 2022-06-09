import 'package:flutter/material.dart';

class SidebarController extends ChangeNotifier{
  int _position = 0;
  int get position => _position;
  static const String header = 'assets/images/logo.png';
  static const array = [
    [0,'Dashboard','assets/icons/menu_dashbord.svg'],
    [1,'Transactions','assets/icons/menu_tran.svg'],
    [2,'Tasks','assets/icons/menu_task.svg'],
    [3,'Documents','assets/icons/menu_doc.svg']
  ];

  void clicked(int position){
    _position = position;
    notifyListeners();
  }


}