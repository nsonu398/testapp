import 'package:flutter/material.dart';

class MedicineController extends ChangeNotifier{
  bool _showNewFieldWidget = false;
  var _array = [['Name','','f'],['Company','','f'],['Type','','f'],['Amount(in mg or ml)','','f'],['Price per pack','','f']];
  int _arrayLength = 5;
  String _searchText = '';
  String _searchTextFieldName = '';


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
  String getFieldProperty(int position){
    return _array[position][0];
  }
  String getFieldValue(int position){
    return _array[position][1];
  }
  String getShowFieldSuggestuions(int index){
    return _array[index][2];
  }
  get array => _array;
  get searchText =>_searchText;
  void setSearchText(String val){
    if(val==''){
      _searchText = 'f';
    }
    else{
      _searchText = val;
    }
    notifyListeners();
  }
  get searchTextFieldName => _searchTextFieldName;
  void setSearchTextFieldName(String val){
    _searchTextFieldName = val;
  }
  //getters and setters//


  //methods//
  void addNewField(List<String> item){
    _array.add(item);
    setArrayLength();
    _showNewFieldWidget = false;
    notifyListeners();
  }
  void addFieldDetails(int index,String value){
    _array[index][1] = value;
  }
  //methods//

}