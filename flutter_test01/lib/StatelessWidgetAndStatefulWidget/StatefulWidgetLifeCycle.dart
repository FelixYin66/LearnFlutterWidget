import 'package:flutter/material.dart';


class StatefulWidgetLifeCycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidgetLifeCycle生命周期',style: TextStyle(fontSize: 20,color: Colors.white),),
        ),
        body: StatefulWidgetLifeCycleBody(),
      ),
    );
  }
}

class StatefulWidgetLifeCycleBody extends StatefulWidget {

  StatefulWidgetLifeCycleBody(){
    print('创建StatefulWidgetLifeCycleBody');
  }

  @override
  _StatefulWidgetLifeCycleBodyState createState(){
    print('调用CreateState');
    return _StatefulWidgetLifeCycleBodyState();
  }
}

class _StatefulWidgetLifeCycleBodyState extends State<StatefulWidgetLifeCycleBody> {
  int count = 0;
  String result = '结果为0';

  @override
  void initState(){
    print('调用调用_StatefulWidgetLifeCycleBodyStated的initState函数');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(StatefulWidgetLifeCycleBody oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  void dispose(){
    super.dispose();
    print('调用_StatefulWidgetLifeCycleBodyStated的dispose函数');
  }

  _StatefulWidgetLifeCycleBodyState(){
    print('调用_StatefulWidgetLifeCycleBodyState构造函数');
  }


  Widget build(BuildContext context) {
    print('Build');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Stateful Button',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              onPressed: () {
                setState(() {
                  print('setState');
                  count++;
                  result = '结果为$count';
                });
              },
            ),
          ],
        ),
        Text(
          result,
          style: TextStyle(fontSize: 19, color: Colors.black),
        )
      ],
    );
  }
}

