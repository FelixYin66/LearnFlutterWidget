import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenFit{
  //使用类访问方便
  static double physicalWidth;
  static double physicalHeight;
  static double screenHeight;
  static double screenWidth;
  static double statusHeight;
  static double dpr;
  static double pointScale; //屏幕适配
  static double pixleScale; //屏幕适配

  //定义类方法 默认750
  static initialize({double standPixle = 750.0}){
    //像素分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //获取设备的像素比
    dpr = window.devicePixelRatio;

    //获取逻辑宽，高
    screenWidth = physicalWidth/dpr;
    screenHeight = physicalHeight/dpr;

    //获取状态栏的高度
    statusHeight = window.padding.top/dpr;

    //以iPhone 6作为标准，计算比例 (像素比，跟点比例)
    pointScale = screenWidth/standPixle;
    pixleScale = screenWidth*2/standPixle;
    print('width == ${screenWidth}');
    print('heigth == ${screenHeight}');
    print('statusH == ${statusHeight}');
  }

  static double pixel(double size){
    //像素
    return ScreenFit.pixleScale*size;
  }

  static double pt(double size){
    //点来计算
    return ScreenFit.pointScale*size;
  }

}
