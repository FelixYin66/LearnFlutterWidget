import 'package:flutter/material.dart';
import 'profilecontent.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人中心'),),
      body: ProfileContent(),
    );
  }
}
