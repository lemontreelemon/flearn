import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class VersionModel with ChangeNotifier{

  String verison = "";

  upDateVersion(String? version){
    if(verison == null)return
    this.verison = version!;
    notifyListeners();
  }

  // Future<void> getVersion() async{
  //   //直接创建 methodchannel
  //   var channel = MethodChannel("flutter_version");
  //   Future.delayed(Duration(seconds: 5),(){
  //     print("delay 的方法");
  //   }).then((value){
  //     print("value == $value");
  //     print("delay 的 then 方法");
  //     return channel.invokeMethod<String?>("getVersion");
  //   }).then((value){
  //     print("delay 的 last 方法");
  //     this.verison = value??"";
  //     notifyListeners();
  //   }).catchError((error){
  //   });
  // }

}