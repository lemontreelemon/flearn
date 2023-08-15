import 'package:flearn/route/custom_page_route.dart';
import 'package:flearn/route/route.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(initialData: _getTime()
    ,builder: (context,snapshot){
          return MaterialApp(
            title: 'Flutter Demo',
            initialRoute:"/" ,
            onGenerateRoute:(routeSetting){
              var routers = getRouters();
              var builder = routers[routeSetting.name];
              if(builder != null){
                return CustomPageRoute(
                  settings: routeSetting,
                  child: builder(context)
                );
              }
            } ,
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: const MyHomePage(),
          );
    });
  }

  _getTime() async{
    print("lwg 初始化操作");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: const Text("导航页"),
     ),
     body: ListView(
       children: [
         GestureDetector(
           onTap: (){
             Navigator.of(context).pushNamed("/provider/home");
           },
           child: Container(
            color: Colors.purple,
             alignment: Alignment.center,
             margin: EdgeInsets.all(12),
             height: 50,
             child: Text(
               "使用 provider",
               style: TextStyle(color: Colors.white),
             ),
           ),
         ),
         ElevatedButton(onPressed: (){
           Navigator.of(context).pushNamed("/inherited/home");
         }, child: Text(
           "使用 inherited"
         ))
       ],
     ),
   );
  }
}
