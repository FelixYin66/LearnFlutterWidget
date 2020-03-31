import 'package:flutter/material.dart';

main(){
   runApp(MyApp2());
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


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Router'),),
//        body: HomePage(),
      ),
      routes: {
        // '/' 字符无法使用
        'home':(context) => HomePage(),
        '/detail1':(context) => DetailPage1(),
        '/detail2':(context) => DetailPage2(),
        '/about':(context) => AboutPage(),
      },
      initialRoute: "home",
      onGenerateRoute: (settings){
        if(settings.name == '/error'){
          return MaterialPageRoute(
            builder: (context){
              return ErrorPage(settings.arguments);
            }
          );
        }
        return null;
      },
      onUnknownRoute: (settings){
        //找不到的路由统一进入次页面
        return MaterialPageRoute(
          builder: (context){
            return UnknownPage(settings.arguments);
          }
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Text('进入详情',style: TextStyle(fontSize: 20),)
                ],
              ),
              onPressed: ()=> _jumpDetail(context),
            ),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Text('进入关于页',style: TextStyle(fontSize: 20),)
                ],
              ),
              onPressed: ()=> _jumpAbout(context),
            ),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Text('进入错误详情',style: TextStyle(fontSize: 20),)
                ],
              ),
              onPressed: ()=> _jumpError(context),
            ),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Text('跳转到新页面',style: TextStyle(fontSize: 20),)
                ],
              ),
              onPressed: ()=> _jumpUnknown(context),
            ),
          ],
        ),
      ),
    );
  }

  //跳转到详情
  _jumpDetail(BuildContext context){
    Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return DetailPage3();
        }
    ));

    //使用异步接收传回来的数据
    result.then((message){
      print('Message === ${message}');
    });
  }

  _jumpAbout(BuildContext context){
    Navigator.of(context).pushNamed('/about',arguments: 'Home Data');
  }

  _jumpError(BuildContext context){
    Navigator.of(context).pushNamed('/error',arguments: 'Error Data');
  }

  _jumpUnknown(BuildContext context){
    Navigator.of(context).pushNamed('/unknown',arguments: 'unKnown Data');
  }
}

//Navigator 基本使用
class DetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页',style: TextStyle(fontSize: 20),),),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.favorite),
                Text('返回首页',style: TextStyle(fontSize: 20),)
              ],
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}

//Push 跟 Pop时传递参数
class DetailPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页面',style: TextStyle(fontSize: 20),),
        leading: RaisedButton(
          child: Icon(Icons.favorite),
          onPressed: ()=> _jumpHome(context),
        ),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('返回首页',style: TextStyle(fontSize: 20),),
                onPressed: (){
                  //返回首页
                  _jumpHome(context);
                },
              )
            ],
          ),
        )
    );
  }

  _jumpHome(BuildContext context){
    Navigator.of(context).pop('详情传回来的数据====1');
  }
}



//Push 跟 Pop时传递参数
class DetailPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        //当为true时，会自动处理返回，为false时 需要自己处理返回
        _jumpHome(context);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('详情页面',style: TextStyle(fontSize: 20),),
            leading: RaisedButton(
              child: Icon(Icons.favorite),
              onPressed: ()=> _jumpHome(context),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('返回首页',style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    //返回首页
                    _jumpHome(context);
                  },
                )
              ],
            ),
          )
      ),
    );
  }

  _jumpHome(BuildContext context){
    Navigator.of(context).pop('详情传回来的数据====1');
  }
}


//Push 跟 Pop时传递参数
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context).settings.arguments as String;

    print('首页传输过来的数据 === ${message}');

    return Scaffold(
        appBar: AppBar(
          title: Text('关于页面 === ${message}',style: TextStyle(fontSize: 20),),
          leading: RaisedButton(
            child: Icon(Icons.favorite) ,
            onPressed: ()=> _jumpHome(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('返回',style: TextStyle(fontSize: 20),),
                onPressed: (){
                  //返回首页
                  _jumpHome(context);
                },
              )
            ],
          ),
        )
    );
  }

  _jumpHome(BuildContext context){
    Navigator.of(context).pop('详情传回来的数据====1');
  }
}


class ErrorPage extends StatelessWidget {
  //通过构造函数接收传过来的数据
  final String data;

  ErrorPage(this.data);

  @override
  Widget build(BuildContext context) {
//    String data = ModalRoute.of(context).settings.arguments;
//    print('传过来的数据 ${data}');
    return Scaffold(
        appBar: AppBar(title: Text('找不到的路由也', style: TextStyle(fontSize: 20),),),
        body: Container(
          child: Text('Error 详情 === Data ${data}',style: TextStyle(fontSize: 20,color: Colors.red),),
        )
    );
  }
}



class UnknownPage extends StatelessWidget {
  //通过构造函数接收传过来的数据
  final String data;

  UnknownPage(this.data);

  @override
  Widget build(BuildContext context) {
//    String data = ModalRoute.of(context).settings.arguments;
//    print('传过来的数据 ${data}');
    return Scaffold(
        appBar: AppBar(title: Text('错误页面', style: TextStyle(fontSize: 20),),),
        body: Container(
          child: Text('Unknown 详情 === Data ${data}',style: TextStyle(fontSize: 20,color: Colors.red),),
        )
    );
  }
}



