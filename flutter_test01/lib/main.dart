import 'package:flutter/material.dart';

//main函数调用flutter 提供的内部函数runApp()
//void main(){
//runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        appBar: AppBar(title: Text(
//            "Flutter程雪",
//          style: TextStyle(
//            fontSize: 30,
//            color: Colors.red
//          ),
//          textDirection: TextDirection.ltr,
//        ),
//        ),
//        body: Center(
//          child: Text(
//            "FelixYin",
//            style: TextStyle(
//                fontSize: 38,
//                color: Colors.white
//            ),
//            textDirection: TextDirection.ltr,
//          ),
//        ),
//      ),
//      ));
//}

//对上面的代码进行重构，代码太长
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
//      body: AppBody()
    body: AppStateFulBody(),
    );
  }
}

class AppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            onChanged: checkBoxChange,
          ),
          Text(
          "同意今天开车",
            style: TextStyle(fontSize:23,
            color: Colors.purple  
            ),
        )
        ],
      mainAxisAlignment: MainAxisAlignment.center,)
    );
  }
}

//定义一个函数 当checkBox调用时使用
void checkBoxChange(value){
  print("checkBox Change $value");
}

class AppStateFulBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppStateFulBodyState();
  }
}

class AppStateFulBodyState extends State<AppStateFulBody>{
  var status = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Row(
          children: <Widget>[
            Checkbox(
              value: this.status,
              onChanged: (value){
                //这种写法是没法出发响应的，虽然值改变了，在flutter需要调用setState出发
//                this.status = value;
              setState(() {
                this.status = value;
              });
              print('onChange Value === $value');
              },
            ),
            Text(
              "同意今天开车",
              style: TextStyle(fontSize:23,
                  color: Colors.purple
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,)
    );
  }
}