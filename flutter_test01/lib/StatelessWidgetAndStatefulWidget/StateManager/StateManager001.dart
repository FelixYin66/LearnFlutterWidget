import 'package:flutter/material.dart';



class ManagerStateApp001 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '状态管理',
            style: TextStyle(fontSize: 20,color: Colors.white,),
          ),
        ),
        body: ManagerStateHomePage(),
      ),
    );
  }
}

class ManagerStateHomePage extends StatefulWidget {
  @override
  _ManagerStateHomePageState createState() => _ManagerStateHomePageState();
}

class _ManagerStateHomePageState extends State<ManagerStateHomePage> {
  int count = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CounterWidget(
        count: count,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardView01(),
              CardView002(),
              FloatingActionButton(onPressed: (){
                count++;
                setState(() {

                });
              })
            ],
          ),
        ),
      ),
    );
  }
}

class CardView01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //通过content获取状态  通过Element树查找最近的一个State,首先是父Widget是有被包裹的
    CounterWidget state = CounterWidget.of(context);
    int count = state.count;

    return Card(
      child: Text('Card $count',style: TextStyle(fontSize: 30),),
      color: Colors.yellow,
    );
  }
}

class CardView002 extends StatefulWidget{
  @override
  _CardView002State createState() => _CardView002State();
}

class _CardView002State extends State<CardView002> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('执行了didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    CounterWidget state = CounterWidget.of(context);
    int count = state.count;
    // TODO: implement build
    return Card(
      child: Text('Card $count',style: TextStyle(fontSize: 30),),
      color: Colors.blueGrey,
    );
  }
}



/*
* 短时管理器
*
* */

class CounterWidget extends InheritedWidget {

  //将需要共享的数据包含在Counter类中
  int count;

  CounterWidget({this.count,Widget child}) : super(child:child);

  //定义一个函数 以方便访问
  static CounterWidget of(BuildContext ctx){
    //按照Element树去寻找最近的CounterElement，找到Element后，去除Element中Widget对象

    //子类中有一个实现了dependOnInheritedWidgetOfExactType 方法去实现查找方法
    return ctx.dependOnInheritedWidgetOfExactType();
  }

  //必须实现 抽象类方法
  @override
  bool updateShouldNotify(CounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    /*
    * 当新的值不等于旧值时 需要更新依赖（决定是否回调StatefulWidget中didChangeDependencies方法）
    *
    * */
    return oldWidget.count !=count;
  }

}