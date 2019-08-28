import 'package:flutter/material.dart' as prefix0;
import 'package:scoped_model/scoped_model.dart';
import '../models/tab.dart';

mixin BrowserModel on Model{
  bool tabMode = false;
  List<Tabs> _tabs = [
    Tabs()
  ];

  List<Tabs> get tabs{
    return _tabs;
  }

  void changeBrowserMode(){
    if(tabMode == false){
      tabMode = true;
      notifyListeners();
    }else if(tabMode == true){
      tabMode = false;
      notifyListeners();
    }
  }

  void addTabs(Tabs newTab){
    _tabs.add(newTab);
    notifyListeners();
  }

  void deleteTabs(int tabToDelete){
    _tabs.removeAt(tabToDelete);
    notifyListeners();
  }

}