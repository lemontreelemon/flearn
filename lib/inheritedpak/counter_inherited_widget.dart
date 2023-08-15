import 'package:flutter/material.dart';

import 'counter_inherited.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key}) : super(key: key);
  @override
  State<MyHomePage1> createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InheritedWidget"),),
      body: CounterInheritedWidget( /// 父节点使用
        count: _count,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [ /// 所有子节点均可以共享数据
              CounterOneWidget(),
              CounterTwoWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(!mounted) return;
          setState(() {
            _count += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterOneWidget extends StatelessWidget {
  const CounterOneWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text(CounterInheritedWidget.of(context)!.count.toString(),style: const TextStyle(fontSize: 20),),
    );
  }
}

class CounterTwoWidget extends StatefulWidget {
  const CounterTwoWidget({Key? key}) : super(key: key);
  @override
  State<CounterTwoWidget> createState() => _CounterTwoWidgetState();
}

class _CounterTwoWidgetState extends State<CounterTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Text(CounterInheritedWidget.of(context)!.count.toString(),style: const TextStyle(fontSize: 20),),
    );
  }
}


