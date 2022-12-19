import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_view_example/listdemo.dart';
import 'package:platform_view_example/webdemo.dart';
import 'native_view.dart';

class NativeViewPage extends StatefulWidget {
  const NativeViewPage({Key? key}) : super(key: key);

  @override
  State<NativeViewPage> createState() => _NativeViewState();
}

class _NativeViewState extends State<NativeViewPage> with WidgetsBindingObserver {
  bool usingHybridComposition = true;
  int count = 10000;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('FC_BASE _NativeViewState.build  [context]');
    return Scaffold(
        appBar: AppBar(
          title: Text('PlatformView demo'),
        ),
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
          child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (s) {
              count = int.parse(s);
            },
          ),
          Expanded(
            child: Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: 10,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 300,
                      height: 100,
                      color: Colors.yellowAccent,
                      // transform: Matrix4.rotationZ(-0.2),
                      child: GestureDetector(
                          child: Text('Flutter UI',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.black)),
                          onTap: () {
                            debugDumpLayerTree();
                          }),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    width: 200,
                    height: 200,
                    // color: Colors.red[600],
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        child: i.isEven ? flutterView : platformView,
                        onTap: () => setState(() {
                              i++;
                            })),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 150,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 120,
                      height: 100,
                      color: Colors.blue[600],
                      // transform: Matrix4.rotationZ(-0.2),
                      child: GestureDetector(
                          child: Text('Flutter UI',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white)),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (c) {
                              return ListDemo();
                            }));
                          }),
                    ),
                  ),
                ),
                Positioned(
                    top: 220,
                    left: 80,
                    child: Opacity(
                      opacity: 0.8,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (c) {
                          //   return WebViewExample();
                          // }));
                          print('DJD dart 刷新当前界面');
                          setState(() {});
                        },
                        child: Container(
                          width: 120,
                          height: 100,
                          color: Colors.green,
                          child: Text('Flutter UI',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          // MaterialButton(
          //   onPressed: () {
          //     // RouteAppController.convertToIamge();
          //   },
          //   child: Text('covertToImageView'),
          // ),
          // MaterialButton(
          //   onPressed: () {
          //     // RouteAppController.jumpToNativeActivity("/NativeView");
          //   },
          //   child: Text('跳转二级页面'),
          // )
        ],
      )),
    );
  }
}
