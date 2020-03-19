import 'package:flutter/material.dart';
import 'homecontent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页',style: TextStyle(fontSize: 20,color: Colors.white
      ),),),
      body: HomeContent(),
    );
  }
}
