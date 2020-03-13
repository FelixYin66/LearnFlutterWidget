import 'package:flutter/material.dart';

class ScrollWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ScrollView",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ScrollView',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: ScrollWidgetAppBody(),
      ),
    );
  }
}


class ScrollWidgetAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListViewContainer(),
        ListViewContainer2(),
        GridViewContainer(),
        CustomScrollViewContainer()
      ],
    );
  }
}


class ListViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black26,
      child: ListView.builder(
          itemCount: 30,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index){
                 return Text('Item $index', style: TextStyle(fontSize: 30,color: Colors.red));
      }
      ),
    );
  }
}

class ListViewContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.black38,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: Text('Leading',style: TextStyle(color: Colors.white,fontSize: 20),),
              title: Text('Title $index',style: TextStyle(color: Colors.black,fontSize: 20),),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return Container(color: Colors.red,height: 2,);
          },
          itemCount: 50
      ),
    );
  }
}



class GridViewContainer extends StatelessWidget {
  // SliverGridDelegateWithMaxCrossAxisExtent

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
      height: 200,
      color: Colors.black45,
      child: GridView.builder(
        itemCount: 20,
        itemBuilder:(BuildContext content,int index){
          return Container(
            color: Colors.blue,
            alignment: Alignment(0, 0),
            child: Text('Item $index'),
          );
        },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5, //宽度是高度的多少倍
          ),
      ),
    );
  }
}


class CustomScrollViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




