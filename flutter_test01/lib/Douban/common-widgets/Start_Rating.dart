import 'package:flutter/material.dart';


/*
*
* 实现的重点：
* 1.巧妙使用Stack 可以叠加特点
* 2.使用ClipRect可裁剪内容（需要自定制裁剪Cliper）
* 3.Dart中命名构造函数，初始化列表使用，如果设置默认值时，需要使用常量。
* 如果想设置默认值,默认值不是常量且有值时用传进来值时，可以使用初始化列表
*
* */
class StarRating extends StatefulWidget {
  double size;
  int count;
  double maxScore;
  double score;

  StarRating(this.score,{this.size = 30,this.count = 5,this.maxScore = 10});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  List<Widget> getStar(){
    //计算整数星星
    double singleStarScore = this.widget.maxScore/this.widget.count;
    int count = (this.widget.score/singleStarScore).floor(); //向下取整
    double decimalPart = this.widget.score/singleStarScore - count;
    //防止超过最大评分数，需要进行特殊处理
    bool result = count >= this.widget.count && decimalPart > 0;
    count = result ? this.widget.count : count;
    decimalPart = result ? 0 : decimalPart;
    //创建整数部分星星
    Icon star = Icon(Icons.star,color: Colors.amberAccent,size: this.widget.size,);
    List<Widget> stars = List.generate(count, (int index){
      return star;
    });

    //构建部分Star  计算需要裁剪部位的范围
    if(decimalPart > 0){
      double size = decimalPart*this.widget.size;
      ClipRect partStar = ClipRect(
        child: star,
        clipper: CustomRectCliper(size),
      );
      stars.add(partStar);
    }
    return stars;
  }

  List<Widget> getEmptyStar(){
    return List.generate(this.widget.count, (int index){
      return Icon(Icons.star_border,color: Colors.grey,size: this.widget.size,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getEmptyStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: getStar(),
        )
      ],
    );
  }
}

class CustomRectCliper extends CustomClipper<Rect>{
  double size;

  CustomRectCliper(this.size);

  @override
  getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, this.size, size.height);
  }

  @override
  bool shouldReclip(CustomRectCliper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.size != this.size;
  }

}