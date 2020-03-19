import 'package:flutter/material.dart';

/*
* 1.使用Flex
* 2.使用SizeBox设置颜色，通过给SizeBox中child添加一个DecoratedBox来设置颜色
*
*
*
* */

class DashLine extends StatelessWidget {
  Axis axis;
  double width;
  double height;
  Color color;
  int count;

  DashLine({
    this.axis = Axis.horizontal,
    this.width = 3,
    this.height = 2,
    this.color = Colors.grey,
    this.count = 10
  });


  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: this.axis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getDashes()
    );
  }

  //创建dash
  List<Widget> getDashes(){
    return List.generate(count, (int index){
      return SizedBox(
        height: height,
        width:  width,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
        ),
      );
    });
  }
}