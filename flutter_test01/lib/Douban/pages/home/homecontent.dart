import 'package:flutter/material.dart';
import 'package:flutter_test01/Douban/Models/home/home_model.dart';
import '../../Services/home_request.dart';
import 'home_movie_item.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<MovieModel> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //请求第一页数据
    HomeRequest.requestMovieList(0).then((List<MovieModel> movies){
      this.movies.addAll(movies);
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context,int index){
          return HomeMovieItem(movies[index]);
        });
  }
}
