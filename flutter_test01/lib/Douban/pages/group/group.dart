import 'package:flutter/material.dart';
import 'groupcontent.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小组'),),
      body: GroupContent(),
    );
  }
}
