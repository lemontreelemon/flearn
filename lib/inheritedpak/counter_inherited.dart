import 'package:flutter/cupertino.dart';

class CounterInherited extends InheritedWidget{

  int count = 0;

  CounterInherited({super.key, required super.child,required this.count});

  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return oldWidget.count != count;
  }
}