import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/StatelessAndStatefulWidget01.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/StatelessWidgetAndListViewTest01.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/StatefulWidgetTest02.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/StatelessWidgetLifeCycle.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/StatefulWidgetLifeCycle.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/BaseWidgetTest001.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/LayoutAppTest001.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/ScrollWidget.dart';
import 'package:flutter_test01/StatelessWidgetAndStatefulWidget/Networking.dart';

void main(){
//    runApp(StatefulWidgetTest02App());
//    runApp(ListViewTestApp());
//runApp(StatelessWidgetLifeCycleApp());
//runApp(StatefulWidgetLifeCycleApp());
//runApp(BaseWidgetTest001App());
//  runApp(LayoutAppTest001());
//runApp(ScrollWidgetApp());

/*
*
* 通过对象调用网络请求
*
* */
NetworkingManager manager = NetworkingManager();
//manager.getRequest('https://httpbin.org/get');
//manager.postRequest('https://httpbin.org/post');

  /*
  *
  * 通过类调用
  *
  * */
NetworkingManager.request('/get',params: {'seconds':23}).then((data){
  print('Get返回数据是：\n$data');
}).catchError((e){
  print('Get 请求捕获的异常 $e');
});


NetworkingManager.request('/post',methond:'post',params: {'seconds':45},inter: InterceptorsWrapper(
    onError: (error){
      print('Post自定义错误拦截');
    },
    onResponse: (resp){
      print('Post自定义响应拦截');
    },
    onRequest: (res){
      print('Post自定义请求拦截');
    })).then((data){
    print('Post返回数据是：$data');
  }).catchError((e){
  print('Post 请求捕获的异常 $e');
});

}
