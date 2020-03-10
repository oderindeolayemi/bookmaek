import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/tab.dart';

mixin BrowserModel on Model{
  bool tabMode = false;
  int activeTab = 0;
  List<Tabs> _tabs = [
    Tabs(url: ''),
    Tabs(url: ''),
    Tabs(url: '')
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

  Future<String> fetchPageTitle (InAppWebViewController controller) async{
    return await controller.getTitle();
  } 

  void addTabs(Tabs newTab){
    _tabs.add(newTab);
    notifyListeners();
  }

  void deleteTabs(int tabToDelete){
    _tabs.removeAt(tabToDelete);
    notifyListeners();
  }

  void updateProgress(double progress, Tabs tab){
    tab.progress = progress;
    notifyListeners();
  }

  Future<void> switchTabs (int index) async{
    activeTab = index;
    //await _tabs[index].controller.loadUrl(url: (_tabs[index].url != 'http://google.com' || _tabs[index].url != '') ? 'http://googler.com'  : _tabs[index].url);
    print(activeTab);
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

  void setTabDetails(int index, String url, String title){
    activeTab = index;
    _tabs[index].url = url;
    _tabs[index].title = title;
    notifyListeners();
  }

  void setTabUrl(int index, String url){
    activeTab = index;
    _tabs[index].url = url;
    notifyListeners();
  }

}