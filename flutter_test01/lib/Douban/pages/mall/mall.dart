import 'package:flutter/material.dart';
import 'mallcontent.dart';

class MallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('市集'),),
      body: MallContent(),
    );
  }
}
