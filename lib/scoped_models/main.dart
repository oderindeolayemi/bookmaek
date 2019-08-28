import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../scoped_models/post_model.dart';
import '../scoped_models/browser_model.dart';


class MainModel extends Model with PostModel, BrowserModel{
  SharedPreferences userPrefs;
  String splashScreenImage;
  bool slideView = true;
  bool gridView = false;
  bool darkMode;
  var time;

  void changeView(){
    if(slideView == true){
      slideView = false;
      gridView = true;
      notifyListeners();
    }else if(slideView == false){
      slideView = true;
      gridView = false;
      notifyListeners();
    }
  }

  void checkTime(){
    time = DateTime.now().toLocal().hour;
    if(time <= 7 && time >= 18){
      print('Its night time');
      splashScreenImage = 'assets/images/ale.jpg';
      darkMode = true;
      notifyListeners();
    }else{
      print('Its daytime');
      splashScreenImage = 'assets/images/test-day.jpg';
      darkMode = false;
      notifyListeners();
    }
  }
  
}