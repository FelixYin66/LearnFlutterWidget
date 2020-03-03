import 'package:flutter/material.dart';

//StatelessWidget生命周期
class StatelessWidgetLifeCycleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(
          'StatelessWidget生命周期',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
        ),),
        body: StatelessWidgetLifeCycleBody('FelixBody'),
      ),
    );
  }
}

/*
* App运行时，StatelessWidgetLifeCycleBody构造函数与build函数会被调用两次
*
* 先调用构造函数，再调用build函数
* */
class StatelessWidgetLifeCycleBody extends StatelessWidget {
  final String message;

  //重写构造函数
  StatelessWidgetLifeCycleBody(this.message){
    print('创建StatelessWidgetLifeCycleBody');
  }

  @override
  Widget build(BuildContext context) {
    print('StatelessWidgetLifeCycleBody中Build方法被调用');
    return Text(
      'Content',
      style: TextStyle(fontSize: 20,color: Colors.red),
    );
  }
}
