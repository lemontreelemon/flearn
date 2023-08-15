import 'dart:io';

import 'package:flearn/plugin/plugin_version_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PluginHomePage extends StatefulWidget {
  const PluginHomePage({Key? key}) : super(key: key);

  @override
  State<PluginHomePage> createState() => _PluginHomePageState();
}

class _PluginHomePageState extends State<PluginHomePage> {

  var versionModel = VersionModel();

  @override
  void initState() {
    super.initState();
    //延时任务，之后获取数据
    versionModel.getVersion();
    Future.delayed(Duration(seconds: 5),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plugin"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider.value(
        value:versionModel,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Consumer<VersionModel>(
            builder: (ctx,versionModel,child){
              if(versionModel.verison.isEmpty || versionModel.verison.length == 0){
                return CircularProgressIndicator(
                  backgroundColor: Colors.white,
                );
              }
              return Text("android version:${versionModel.verison}");
            },
          ),
        ),
      ),
    );
  }

}
