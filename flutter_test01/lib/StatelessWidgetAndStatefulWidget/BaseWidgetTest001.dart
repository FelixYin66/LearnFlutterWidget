import 'package:flutter/material.dart';

class BaseWidgetTest001App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseWidgetTest001AppHome(),
    );
  }
}

class BaseWidgetTest001AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text练习',
           style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
      body: BaseWidgetTest001HomeBody(),
    );
  }
}

class BaseWidgetTest001HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      TextWidget(),
      SizedBox(height: 30),
      ButtonWidget(),
      SizedBox(height: 30),
      ImageWidget(),
      SizedBox(height: 30),
      TextFieldWidget(),
    ]
    );
  }
}

//文本Widge练习
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Text基本属性及富文本',
            style: TextStyle(fontSize: 30,color: Colors.red),
          ),
          SizedBox(height: 15),
          Text(
            "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。。。。。。。。。。",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
            //文本布局方式（从左到右还是从右到左）
            textDirection: TextDirection.ltr,
            //文本对齐方式
            textAlign: TextAlign.center,
            //超出部分如何显示，以ellipsis显示（...）
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            //控制文本缩放
            textScaleFactor: 1,

          ),
          SizedBox(
            height:30 ,
          ),
          Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '《定风波》',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
                  TextSpan(text: '苏轼',style: TextStyle(fontSize: 15)),
                  TextSpan(text: '\n莫听穿林打叶声,何妨吟啸且徐行'),
                  TextSpan(text: '\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生'),
                  TextSpan(text: '\n'),
                ]
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '不同Button',
            style: TextStyle(fontSize: 30,color: Colors.red),
          ),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: (){
              print('RainseButton');
            },
            child: Text(
              'RaiseButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.green,
            highlightColor: Colors.yellowAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: (){
              print('FloatingActionButton');
            },
            child: Text(
              'FloatingActionButton',
              style: TextStyle(fontSize: 18,color: Colors.redAccent),
            ),
            foregroundColor: Colors.red,
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(height: 15),
          FlatButton(
            onPressed: (){
              print('FlatButton');
            },
            child: Text(
              'FlatButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.blue,
            highlightColor: Colors.yellowAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          OutlineButton(
            onPressed: (){
              print('OutlineButton');
            },
            child: Text(
              'OutlineButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}

/*
* 本地图片需要在pubspec.yaml配置文件中配置
* 需要添加标签：
* assets：
* - images/panda.png
*
* */
class ImageWidget extends StatelessWidget {
  final String imgURL = 'http://a0.att.hudong.com/16/12/01300535031999137270128786964.jpg';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Image使用及加载方式',
          style: TextStyle(fontSize: 30,color: Colors.red),
        ),
        SizedBox(height: 15),
        //加载网络图片
        Image.network(imgURL),
        SizedBox(height: 15),
        Image.asset('images/panda.png'),
        SizedBox(height: 15),
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(imgURL),
          child: Container(
            child: Text(
              'CircleAvatar',
              style: TextStyle(fontSize: 20,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            width: 200,
            height: 200,
            color: Colors.black26,
            alignment: Alignment(0,0),
          ),
        ),
        SizedBox(height: 15,),
        ClipOval(
          child: Image.network(
              imgURL,
            width: 200,
            height: 200,
//            color: Colors.black38,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              imgURL,
              width: 200,
              height: 200,
//            color: Colors.black38,
          ),
        )
      ],
    );
  }
}


class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'TextField使用',
          style: TextStyle(fontSize: 30,color: Colors.red),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}





