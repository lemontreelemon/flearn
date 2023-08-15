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

  Future<void> getVersion() async {

    //直接创建 methodchannel
    var channel = MethodChannel("flutter_version");
    var version = await channel.invokeMethod<String?>("getVersion");
    Future.delayed(Duration(seconds: 5),(){
      this.verison = version!;
      notifyListeners();
    });
  }

}