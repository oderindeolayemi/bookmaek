import 'package:scoped_model/scoped_model.dart';
import '../models/tab.dart';

mixin BrowserModel on Model{
  bool tabMode = false;
  List<Tabs> _tabs = [
    Tabs()
  ];

  List<Tabs> get tabs{
    return _tabs.toList();
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

  //void setTabUrl(int index, String url){
  //  _tabs[index].url = url;
  //  notifyListeners();
  //}

  void updateProgress(double progress, Tabs tab){
    tab.progress = progress;
    notifyListeners();
  }

  Future<void> goToPage (String url, Tabs tab) async{
    await tab.controller.loadUrl(url: url);
    tab.url = await tab.controller.getUrl();
    notifyListeners();
  }

  Future<void> goBack (Tabs tab) async{
    await tab.controller.goBack();
    tab.url = await tab.controller.getUrl();
    print(tab.url);
    notifyListeners();
  }

  Future<void> goForward (Tabs tab) async{
    await tab.controller.goForward();
    tab.url = await tab.controller.getUrl();
    print(tab.url);
    notifyListeners();
  }

  Future<void> refreshTab(Tabs tab) async{
    await tab.controller.reload();
    tab.url = await tab.controller.getUrl();
    notifyListeners();
  }

  String getCurrentUrl(Tabs tab){
    return tab.url;
  }

  void setTabUrl(int index, String url){
    _tabs[index].url = url;
    notifyListeners();
  }

}