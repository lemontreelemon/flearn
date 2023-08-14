import 'package:flutter/cupertino.dart';

class InheritedHome extends StatefulWidget {
  const InheritedHome({Key? key}) : super(key: key);

  @override
  State<InheritedHome> createState() => _InheritedHomeState();
}

class _InheritedHomeState extends State<InheritedHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
