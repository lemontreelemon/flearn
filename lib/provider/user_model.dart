import 'package:flearn/provider/user_bean.dart';
import 'package:flearn/provider/user_bean.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier{

  UserModel(this.user);

  User? user;

  void changeUser(User? newUser){
    if(newUser == null) return;
    user = newUser;
    notifyListeners();
  }

}