import 'package:flutter/material.dart';

class ListViewTestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text(
        "ListView",
        style: TextStyle(fontSize: 20,color: Colors.white),
      ),
    ),
    body: ListViewBody(),
  ),
  debugShowCheckedModeBanner: false,
);
  }
}

class ListViewBody extends StatelessWidget{
  final String imgURL = 'http://a0.att.hudong.com/16/12/01300535031999137270128786964.jpg';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
     children: <Widget>[
       ListViewBodyItem('小老虎01','可爱的小老虎01',imgURL),
       ListViewBodyItem('小老虎02','可爱的小老虎02',imgURL),
       ListViewBodyItem('小老虎03','可爱的小老虎03',imgURL)
     ],
    );
  }
}

class ListViewBodyItem extends StatelessWidget{
  final String title;
  final String detail;
  final String imgurl;

  //初始化方法 必须给final设置初始值，要不然会报错
  ListViewBodyItem(this.title,this.detail,this.imgurl);

  //  重写父类build方法
  //Container 的内边距为10，边框边距为3，颜色为绿色
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color:Colors.greenAccent,
        ),
        color:Colors.yellowAccent,
      ),
      child: Column(
        //交叉轴靠左边显示
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //添加文本
          Text(
              title,
              style:TextStyle(fontSize: 30)
          ),
          //添加上下间距
          SizedBox(height: 5),
          //添加文本
          Text(
              detail,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 5),
          Image.network(imgurl)
        ],
      ),
    );
  }
}