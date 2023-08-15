import 'package:flutter/widgets.dart';

class VersionModel with ChangeNotifier{

  String verison = "";

  upDateVersion(String? version){
    if(verison == null)return
    this.verison = version!;
    notifyListeners();
  }

}