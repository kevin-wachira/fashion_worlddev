import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';


Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoryToJson(Categories data) => json.encode(data.toJson());

class Categories{
  int id;
  String name;
  String description;

  Categories({this.name,this.description});

  Map<String,dynamic> toJson()=>{
    'name':this.name,
    'description':this.description
  };

  factory Categories.fromJson(Map<String,dynamic> json){
    return Categories(
      name:json['name'],
      description: json['description']
    );
  }


}