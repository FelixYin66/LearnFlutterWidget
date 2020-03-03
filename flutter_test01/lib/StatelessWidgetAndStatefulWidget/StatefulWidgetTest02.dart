import 'package:flutter/material.dart';

class StatefulWidgetTest02App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'StatefulWidgetTest02',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
          ),
        ),
      body: StatefulWidgetTest02AppBody(),
      ),
    );
  }
}


class StatefulWidgetTest02AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulWidgetBodyContent();
  }
}


class StatefulWidgetBodyContent extends StatefulWidget {
  @override
  _StatefulWidgetBodyContentState createState() => _StatefulWidgetBodyContentState();
}

class _StatefulWidgetBodyContentState extends State<StatefulWidgetBodyContent> {
  String result = '当前计数为:0';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child:Text(
                    '+',
                    style: TextStyle(fontSize: 20,color: Colors.purple),
                  ),
                  onPressed: (){
                    print('点击加号');
                    setState(() {
                      count++;
                      result = '当前计数为:$count';
                    });
                  },
                ),
                RaisedButton(
                  child:Text(
                    '-',
                    style: TextStyle(fontSize: 20,color: Colors.green),
                  ),
                  onPressed: (){
                    print('点击减号');
                    setState(() {
                      count--;
                      if(count < 0){
                        count = 0;
                        return;
                      }
                      result = '当前计数为:$count';
                    });
                  },
                ),
              ]
          ),
          Text(
            result,
            style: TextStyle(fontSize: 20,color: Colors.black),
          )
        ],
      ),
    );
  }
}
