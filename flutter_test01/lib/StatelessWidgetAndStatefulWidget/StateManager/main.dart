import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StateManager001.dart';
import 'viewmodel.dart';
import 'viewmodel02.dart';

/*
* 如何使用Provider:
* 1.创建自己需要共享的数据
* 2.在应用最顶层嵌套一个ChangeNotifierProvider
* 3.在需要使用的地方时用provider
*
* 监听方式有：
* 1.Provider.of()
* 2.Consumer (Consumer必须告诉获得的数据类型，如果没有写 运行报错)
* 3.Selector
*
* 区别：
*
* Provider 会刷新整个build 而 Consumer只调用Consumer中的builder方法，而不会调用整个build方法
*
*
*
*
*
*
* */
void main(){
//  runApp(ManagerStateApp());
//  runApp(ManagerStateApp001());

//单个状态管理
//runApp(ChangeNotifierProvider(
//  child: ManagerStateApp(),
//  create: (ctx){
//    return Person();
//  }
//));

//多个状态管理 使用MultiProvider
  runApp(
    MultiProvider(
      child: ManagerStateApp(),
      providers: [
        ChangeNotifierProvider(
          create: (ctx){
            return Person();
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            return Student();
          },
        ),
      ],
  ),
  );
}


class ManagerStateApp extends StatelessWidget {
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
    //想使用provider提供的数据 需要使用cusomer 消费者
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardView01(),
            CardView02(),
            CardView03(),
            CardView04(),
            Selector<Person,Person>(
              shouldRebuild: (pre,next){
                //告诉是否需要重新构建  从而优化了，监听者Widget中build方法
                return false;
              },
              selector: (ctx,person){
                //不需要转换到其他类型，直接返回
                return person;
              },
              builder: (ctx,person,child){
                print('FloatingActionButton Builder');

                //未优化版本
                //最好不需要构建 FloatingActionButton  需要优化
//                return FloatingActionButton(
//                  child: Icon(Icons.add),
//                    onPressed: (){
//                  person.age++;
//                });
                //优化版本
                return FloatingActionButton(
                  //使用customer的child 避免重新构建子Widget
                  child: child,
                    onPressed: (){
                      person.age++;
                    });
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class CardView01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CardView01 收到通知');
    //通过特有方式获取共享的数据 (添加监听) ，只要收到通知就会重新build
    Person p = Provider.of<Person>(context);
    int count = p.age;

    return Card(
      child: Text('Card $count',style: TextStyle(fontSize: 30),),
      color: Colors.yellow,
    );
  }
}


class CardView02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //通过特有方式获取共享的数据 (添加监听)，只要收到通知就会重新build
//    Person p = Provider.of<Person>(context);
//    int count = p.age;
    print('CardView02 收到通知');
    return Card(
      child: Consumer<Person>(
        builder: (ctx,person,child){
          print('CardView02 收到通知 Builder');
          return Text('Card ${person.age}',style: TextStyle(fontSize: 30),);
        },
      ),
      color: Colors.blueGrey,
    );
  }
}

class CardView03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //通过特有方式获取共享的数据 (添加监听)，只要收到通知就会重新build
//    Person p = Provider.of<Person>(context);
//    int count = p.age;
    print('CardView03 收到通知');
    return Card(
      child: Consumer<Student>(
        builder: (ctx,stu,child){
          print('CardView03 收到通知 Builder');
          return Text('学生名：${stu.name}',style: TextStyle(fontSize: 30),);
        },
      ),
      color: Colors.blueGrey,
    );
  }
}



class CardView04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //通过特有方式获取共享的数据 (添加监听)，只要收到通知就会重新build
//    Person p = Provider.of<Person>(context);
//    int count = p.age;
    print('CardView04 收到通知');
    return Card(
      child: Consumer2<Student,Person>(
        builder: (ctx,stu,person,child){
          print('CardView04 收到通知 Builder');
          return Text('学生名：${stu.name} 年龄:${person.age}',style: TextStyle(fontSize: 30),);
        },
      ),
      color: Colors.blueGrey,
    );
  }
}

//class CardView002 extends StatefulWidget{
//  @override
//  _CardView002State createState() => _CardView002State();
//}

//class _CardView002State extends State<CardView002> {
//
//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//    super.didChangeDependencies();
//    print('执行了didChangeDependencies');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    CounterWidget state = CounterWidget.of(context);
//    int count = state.count;
//    // TODO: implement build
//    return Card(
//      child: Text('Card $count',style: TextStyle(fontSize: 30),),
//      color: Colors.blueGrey,
//    );
//  }
//}




