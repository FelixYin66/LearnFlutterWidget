import 'package:flutter/material.dart';

class LayoutAppTest001 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Layout布局样式',
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
        ),
        body: LayoutAppTest001Body(),
      ),
    );
  }
}

class LayoutAppTest001Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            AlignFlex(),
            SizedBox(height: 30,),
            PaddingFlex(),
            SizedBox(height: 30,),
            ContainerFlex(),
            SizedBox(height: 30,),
            RowFlex(),
            SizedBox(height: 30,),
            Row2Flex(),
            SizedBox(height: 30,),
            StackFlex()
          ],
        ),
      ],
    );
  }
}

class AlignFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 3,
      heightFactor: 3,
      alignment: Alignment.bottomRight,
      child: Text(
        'Aligin练习',
        style: TextStyle(fontSize: 20,color: Colors.blue),
      ),
    );
  }
}

class PaddingFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: 200,
      height: 120,
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            padding: EdgeInsets.all(12),
            color: Colors.white,
            child: Text(
              'Padding练习',
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerFlex extends StatelessWidget {
  /*
  * Container中的color会与decoration对象中color冲突，不同同时设置值
  * Container中装饰的类为Decoration的子类BoxDecoration,LogoDecoration
  * Container中会优先使用设置的width跟height
  * Container中decoration可以设置渐变，通过BoxDecoration属性gradient
  * Container中可以设置阴影，通过BoxDecoration属性shadow
  * Container中可以设置圆角，通过BoxDecoration属性boderRadius设置圆角
  * Container中可以设置圆角，通过BoxDecoration属性border设置边框
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 180,
      margin: EdgeInsets.all(30),
      color: Colors.black,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        width: 10,
        height: 10,
        constraints: BoxConstraints(
            minWidth: 10,
            maxWidth: 20,
            minHeight: 10,
            maxHeight: 30
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2,color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color:Colors.blue,
                  offset: Offset(10,10),
                  blurRadius: 20
              ),
            ],
            gradient: RadialGradient(
              radius: 5,
              colors: [
                Colors.grey,
                Colors.yellow,
                Colors.red
              ]
            )
        ),
//        color: Colors.white,
        child: Text(
            'Container',
             style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}


/*
* 子Row的对其方式是收父Row影响的，如果父Row的对其方式Center，子Row对其方式是Start。子Row的对齐方式
* 设置的值无效
*
* Row测试demo写了，Column就不写了  只是主轴布局方向不一样而已
*
* */
class RowFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(color: Colors.red,width: 60,height: 60,),
            Container(color: Colors.blue,width: 80,height: 80,),
            Container(color: Colors.green,width: 70,height: 70,),
            Container(color: Colors.orange,width: 80,height: 80,),
        ],),
      ],
    );
  }
}

/*
* Row中嵌套Row使用时，使用ExPanded出现加载不出来的情况
*
*
*
*
*
*
*
* */
class Row2Flex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //有问题的写法
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        Row(
////          textBaseline: TextBaseline.alphabetic,
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Container(color: Colors.red,height: 60,),
//            ),
//            Container(color: Colors.blue,width: 80,height: 80,),
//            Container(color: Colors.green,width: 70,height: 70,),
//            Expanded(
//              flex: 1,
//              child: Container(color: Colors.orange,height: 80,),
//            )
//          ],),
//      ],
//    );
  //没有问题的写法
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.red,width: 60,height: 60,),
        ),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70,),
        Expanded(
          flex: 2,
          child: Container(color: Colors.orange,width: 80,height: 80,),
        )
      ],
    );
  }
}

class StackFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.rtl,
      fit: StackFit.loose,
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          color: Colors.purple,
          width: 300,
          height: 300,
        ),
        Positioned(
          left: 10,
          top: 20,
          child: Icon(Icons.add,size: 50, color: Colors.white,),
        ),
        Positioned(
          bottom: -10,
          right: 20,
          child: Text(
            '你好啊，李银河',
            style: TextStyle(fontSize: 20,color: Colors.blue),
          ),
        )
      ],
    );
  }
}






