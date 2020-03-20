import '../../StatelessWidgetAndStatefulWidget/Networking.dart';
import '../Models/home/home_model.dart';

/*
* 首页数据请求
*
*
* */

class HomeRequest{
    //请求电影列表
   static Future<List<MovieModel>> requestMovieList(int start) async{
      String requestURL = '/movie/top250?start=$start&count=20';
      Map result = await NetworkingManager.request(requestURL);
      List movies = result['subjects'];

      List<MovieModel> movieModels = [];
      for(var item in movies){
        movieModels.add(MovieModel.fromMap(item));
      }
      return movieModels;
    }
}