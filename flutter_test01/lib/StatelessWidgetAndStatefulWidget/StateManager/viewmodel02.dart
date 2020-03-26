import 'package:flutter/material.dart';

/*
* 需要共享的话需要继承自ChangeNotifier或者混入
*
* */
class Student with ChangeNotifier {
  //只有私有属性才能添加 get,set方法
  String _name = 'Felix';

  String get name => _name;

  set name(String value) {
    _name = value;
    //通知监听者数据有改变
    notifyListeners();
  }


}