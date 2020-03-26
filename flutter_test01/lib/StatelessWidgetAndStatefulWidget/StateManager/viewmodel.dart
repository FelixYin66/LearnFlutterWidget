import 'package:flutter/material.dart';

/*
* 需要共享的话需要继承自ChangeNotifier或者混入
*
* */
class Person with ChangeNotifier {
  //只有私有属性才能添加 get,set方法
  int _age = 100;

  int get age => _age;

  set age(int value) {
    _age = value;
    //发送通知，通知监听者，数据改变了
    notifyListeners();
  }


}