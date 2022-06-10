import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class SharedPrefController extends ChangeNotifier{
  late Preference<String> _counter;
  String counter = '0';
  SharedPrefController() {
    init();

  }

  void init() async{
    WidgetsFlutterBinding.ensureInitialized();
    final preferences = await StreamingSharedPreferences.instance;
    Preference<String> c = preferences.getString('counter', defaultValue: '0');
    this._counter = c;

    //observe the values
    observe();
  }

  void observe() {
    _counter.listen((value) {
      this.counter = value;
      notifyListeners();
    });
  }

  String get c =>counter;

  void setCounter(String value){
    _counter.setValue(value);
  }



}