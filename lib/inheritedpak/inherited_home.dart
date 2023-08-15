import 'package:flearn/inheritedpak/counter_inherited.dart';
import 'package:flutter/material.dart';

class InheritedHome extends StatefulWidget {
  const InheritedHome({Key? key}) : super(key: key);

  @override
  State<InheritedHome> createState() => _InheritedHomeState();
}

class _InheritedHomeState extends State<InheritedHome> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("inherited"),
        centerTitle: true,
      ),
      body: CounterInherited(count: _count, child: Builder(builder: (innerc){
        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                "${CounterInherited.of(innerc)?.count}", style: TextStyle(
                  color: Colors.green,
                  fontSize: 24
              ),),
              Container(
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    "${CounterInherited.of(innerc)?.count}", style: TextStyle(
                      color: Colors.green,
                      fontSize: 24
                  ),),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: Center(
                    child: Builder(
                      builder: (innerContext) {
                        return Text("${CounterInherited.of(innerc)?.count}",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 24
                          ),);
                      },
                    )
                ),
              )
            ],
          ),
        );
      },)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}
