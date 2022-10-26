import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_view_example/webdemo.dart';
import 'native_view.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<ListDemo> createState() => _NativeViewState();
}

class _NativeViewState extends State<ListDemo> {
  bool usingHybridComposition = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('PlatformView demo'),
        // ),
        body: buildBody());
  }

  Widget platformView = NativeView(true);
  Widget flutterView = Container(
    // width: 200,
    // height: 150,
    constraints: BoxConstraints.expand(),

    color: Colors.red,
    child: Text(
      'FlutterView!!!!',
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
  );
  int i = 1;

  Widget buildBody() {
    if (!Platform.isAndroid) {
      return Center(
        child: Text('该页面目前只支持了Android'),
      );
    }
    return Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.white70,
      child: Center(
          child: ListView.builder(itemBuilder: (i,c){
            return Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.only(bottom: 20),
              child: platformView,
            );
          },itemCount: 20),),
    );
  }
}
