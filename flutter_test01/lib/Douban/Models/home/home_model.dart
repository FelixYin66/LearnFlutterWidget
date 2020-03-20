import 'dart:convert';

class Person{
  String name;
  String avatarURL;

  Person.fromMap(Map<String,dynamic> map){
    this.name = map['name'];
    this.avatarURL = map['avatars']['medium'];
  }
}

class Actor extends Person{
  Actor.fromMap(Map<String,dynamic> map): super.fromMap(map);
}

class Director extends Person{
  Director.fromMap(Map<String,dynamic> map): super.fromMap(map);
}


int counter = 1;
class MovieModel {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieModel.fromMap(Map<String,dynamic> map){
    this.rank = counter++;
    this.imageURL = map['images']['medium'];
    this.title = map['title'];
    this.playDate = map['year'];
    this.rating = map['rating']['average'];
    this.genres = map['genres'].cast<String>();
    this.casts = (map['casts'] as List<dynamic>).map((item){
      return Actor.fromMap(item);
    }).toList();
    this.director = Director.fromMap(map['directors'][0]);
    this.originalTitle = map['original_title'];
  }

}