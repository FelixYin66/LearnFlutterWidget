import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';


/*
* 定义一个全局事件总线，两个Widget通讯很方便
*
* */

final eventBus = EventBus();

class UserInfo{
  String name;
  int age;
  UserInfo({String name,int age}){
    this.name = name;
    this.age = age;
  }
}


main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Router'),),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(

        )
    );
  }
}


class EventButDemo extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EventButDemo> {
  String _name = '我是Felix';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //添加监听事件
    eventBus.on<UserInfo>().listen((data){
       print(data.name);
       print(data.age);
       setState(() {
         _name = '${data.name} === ${data.age}';
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('修改我的名字'),
                color: Colors.yellow,
                onPressed: (){
                  UserInfo data = UserInfo(name:'修改的名字',age:13);
                  eventBus.fire(data);
                },
              ),
              Text(_name,style: TextStyle(fontSize: 16,color: Colors.white),),
            ],
          ),
          alignment: AlignmentDirectional.center,
        )
    );
  }
}



class IgnorePointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details){
            print('Parent Tap');
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: IgnorePointer(
              child: GestureDetector(
                onTapDown: (TapDownDetails details){
                  print('Sub Tap');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            alignment: AlignmentDirectional.center,
          ),
        )
    );
  }
}




class GestureDetectorDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details){
            print('Parent Tap');
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: GestureDetector(
              onTapDown: (TapDownDetails details){
                print('Sub Tap');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            alignment: AlignmentDirectional.center,
          ),
        )
    );
  }
}



class GestureDetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: (){
            print('按下');
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: Text('Point使用',style: TextStyle(fontSize: 20),),
            alignment: AlignmentDirectional.center,
          ),
        )
    );
  }
}


/*
* 使用原始指针监听点击事件
*
* */
class PointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Listener(
          onPointerDown: (PointerDownEvent event){
            print('按下');
          },
          onPointerMove: (PointerMoveEvent event){
            print('移动');
          },
          onPointerCancel: (PointerCancelEvent event){
            print('取消');
          },
          onPointerUp: (PointerUpEvent event){
            print('抬起');
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: Text('Point使用',style: TextStyle(fontSize: 20),),
            alignment: AlignmentDirectional.center,
          ),
        )
    );
  }
}