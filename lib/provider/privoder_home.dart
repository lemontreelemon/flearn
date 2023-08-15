import 'package:flearn/provider/user_bean.dart';
import 'package:flearn/provider/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHome extends StatefulWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
      ),
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ct) => UserModel(User.value(name: "张三", age: 22)),
            ),
          ],
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<UserModel>(
                  builder: (cContext, userModel, child) {
                    return Text(
                        "姓名：${userModel.user?.name}   年龄：${userModel.user?.age}");
                  },
                ),
                Consumer<UserModel>(
                  builder: (cContext, userModel, child) {
                    return Text(
                        "姓名：${userModel.user?.name}   年龄：${userModel.user?.age}");
                  },
                ),
                Selector<UserModel, User>(
                  builder: (ctx, user, child) {
                    return Text("姓名：${user?.name}   年龄：${user?.age}");
                  },
                  selector: (ctx, userModel) => userModel.user ?? User(),
                ),
                Builder(
                  builder: (in1) {
                    return Text(
                        "姓名：${Provider.of<UserModel>(in1).user?.name}   年龄:${Provider.of<UserModel>(in1).user?.age}");
                  },
                ),
                Consumer<UserModel>(
                  builder: (context, userModel, child) {
                    return ElevatedButton(
                      onPressed: () {
                        userModel.changeUser(User.value(name: "李四", age: 77));
                      },
                      child: child,
                    );
                  },
                  child: Text("修改名字"),
                ),
              ],
            ),
          )),
    );
  }
}
