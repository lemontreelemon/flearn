

import 'package:flutter/material.dart';

class CounterInherited extends InheritedWidget{

  int count = 0;

  CounterInherited({Key? key, required Widget child,required this.count}):super(key: key,child: child);

  @override
  bool updateShouldNotify( CounterInherited oldWidget) {
    return oldWidget.count != count;
  }

  static CounterInherited? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    // return context.getElementForInheritedWidgetOfExactType<CounterInherited>()?.widget as CounterInherited;
  }

}

class CounterInheritedWidget extends InheritedWidget {
  /// 构造方法
  const CounterInheritedWidget({Key? key, required this.count,
    required Widget child}):super(key:key, child: child);

  /// 需要共享的数据
  final int count;

  /// 默认的约定：如果状态是希望暴露出的，应当提供一个`of`静态方法来获取其对象，开发者便可直接通过该方法来获取
  /// 返回实例对象，方便子树中的widget获取共享数据
  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  /// 是否通知widget树中依赖该共享数据的子widget
  /// 这里当count发生变化时，是否通知子树中所有依赖count的Widget重新build
  /// 这里判断注意：是值改变还是内存地址改变。
  @override
  bool updateShouldNotify(covariant CounterInheritedWidget oldWidget) {
    return count != oldWidget.count;
  }
}
