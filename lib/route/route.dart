
import 'package:flutter/cupertino.dart';

import '../inheritedpak/inherited_home.dart';
import '../main.dart';
import '../provider/privoder_home.dart';

Map<String,WidgetBuilder> getRouters(){
  return <String,WidgetBuilder>{
    "/":(context) => MyHomePage(),
    "/provider/home" : (context) => ProviderHome(),
    "/inherited/home":(context) => InheritedHome()
  };
}