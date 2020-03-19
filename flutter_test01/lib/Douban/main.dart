import 'package:flutter/material.dart';
import 'package:flutter_test01/Douban/common-widgets/Start_Rating.dart';
import 'package:flutter_test01/Douban/common-widgets/Dash_Line.dart';
import 'package:flutter_test01/Douban/pages/main/main.dart';


main(){
  runApp(DouBanApp());
}


class DouBanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home: Scaffold(
        body: HomeMainPage(),
      ),
    );
  }
}

class DouBanHome extends StatelessWidget {
  @override
//  StarRating(5,maxScore: 10,count: 3,),
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        width: 100,
        child: DashLine(axis: Axis.vertical),
      )
    );
  }
}




