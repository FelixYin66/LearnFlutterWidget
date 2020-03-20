import 'package:flutter/material.dart';
import 'package:flutter_test01/Douban/common-widgets/Dash_Line.dart';
import 'package:flutter_test01/Douban/common-widgets/Start_Rating.dart';
import '../../Models/home/home_model.dart';

class HomeMovieItem extends StatelessWidget {
  MovieModel model;

  HomeMovieItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
                    bottom: BorderSide(width: 8,color: Colors.grey
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 8,),
          buildContent(),
          SizedBox(height: 8,),
          buildBottom(),
        ],
      )
    );
  }

  Widget buildHeader(){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text('No ${model.rank}',style: TextStyle(fontSize: 18,color: Colors.orange),),
    );
  }

  Widget buildContent(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentFavorite()
      ],
    );
  }

  Widget buildBottom(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(model.originalTitle,style: TextStyle(fontSize: 18,color: Colors.grey),),
    );
  }

  Widget buildContentImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        model.imageURL,
        height: 150,
      ),
    );
  }

  Widget buildContentInfo(){
    return Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentInfoMovieName(),
        SizedBox(height: 5,),
        buildContentInfoRating(),
        SizedBox(height: 5,),
        buildContentInfoActor()
      ],
    ),);
  }

  Widget buildContentInfoMovieName(){
    return Row(
      children: <Widget>[
        Icon(Icons.play_circle_filled,color: Colors.red,),
        Text(model.title,style: TextStyle(fontSize: 18,fontWeight:FontWeight.w500 ),),
        Text('(${model.playDate})',style: TextStyle(fontSize: 14,color: Colors.grey),)
      ],
    );
  }

  Widget buildContentInfoRating(){
    return Row(
      children: <Widget>[
        StarRating(model.rating,count: 5,maxScore: 10,size: 20,),
        SizedBox(width: 10,),
        Text('${model.rating}',style: TextStyle(color: Colors.black),)
      ],
    );
  }

  Widget buildContentInfoActor(){
    String generating = model.genres.join(" ");
    String director = model.director.name;
    String actors = model.casts.map((Actor a) => a.name).toList().join(" ") ;

    return Text(
      '$generating/$director/$actors',
      style: TextStyle(fontSize: 16),
      maxLines: 2,
      overflow:TextOverflow.ellipsis,
    );
  }

  Widget buildContentLine(){
    return Container(
      child: DashLine(count: 10,height: 5,color: Colors.grey,axis: Axis.vertical,),
      height: 100,
    );
  }


  Widget buildContentFavorite(){
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite,color: Colors.yellow,size: 50,),
          SizedBox(height: 10,),
          Text('想看',style: TextStyle(fontSize: 20,color: Colors.yellow),)
        ],
      ),
    );
  }

}
