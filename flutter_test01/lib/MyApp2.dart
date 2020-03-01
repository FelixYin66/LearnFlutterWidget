import 'package:flutter/material.dart';

void main() =>runApp(MyApp()); //使用箭头函数更整洁（函数体中只有一行代码时）

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppHome());
  }
}

class AppHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text(
          "Flutter 程序",
          style: TextStyle(
              fontSize: 30,
              color: Colors.greenAccent
          ),
          textDirection: TextDirection.ltr,
        ),
        ),
        body: AppBody()
    );
  }
}

class AppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Text(
        "FelixYin",
        style: TextStyle(
            fontSize: 38,
            color: Colors.red
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

