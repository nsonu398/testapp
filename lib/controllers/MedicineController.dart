import 'package:flutter/material.dart';

class MedicineController extends ChangeNotifier{
  bool _showNewFieldWidget = false;
  var _array = [['Name',''],['Company',''],['Type',''],['Amount(in mg or ml)',''],['Price per pack','']];
  int _arrayLength = 5;


  //getters and setters//
  get arrayLength => _arrayLength;
  void setArrayLength(){
    _arrayLength = _array.length;
  }
  bool get showNewFieldWidget => _showNewFieldWidget;
  void setShowNewFieldWidget(bool value) {
    _showNewFieldWidget = value;
    notifyListeners();
  }
  String getProperty(int position){
    return _array[position][0];
  }
  get array => _array;
  //getters and setters//


  //methods//
  void addNewField(List<String> item){
    _array.add(item);
    setArrayLength();
    _showNewFieldWidget = false;
    notifyListeners();
  }
  //methods//

}