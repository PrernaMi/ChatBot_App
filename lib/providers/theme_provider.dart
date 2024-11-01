import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;
  SharedPreferences ?prefs;

  void setTheme({required bool mTheme})async{
    _isDark  = mTheme;
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool("theme", _isDark);
    notifyListeners();
  }

  bool getTheme()=> _isDark;

  void defaultTheme()async{
    prefs = await SharedPreferences.getInstance();
    _isDark = prefs!.getBool("theme")!;
    notifyListeners();
  }

}