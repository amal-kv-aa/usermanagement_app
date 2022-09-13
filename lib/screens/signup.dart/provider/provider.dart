import 'package:flutter/cupertino.dart';

class LoginSignup with ChangeNotifier{
 String title=''; 
 
void addtitile(String title ){
  title = title;
  notifyListeners();
}
}