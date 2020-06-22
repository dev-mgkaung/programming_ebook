import 'package:flutter/material.dart';

class Category {
  final String name;
  final String total;
  final String description;
  final String image;

  const Category(
      {  this.name,this.total,  this.description,  this.image});

  @override
  List<Object> get props =>
      [
        name,
        total,
        description,
        image
      ];
}




List<Category> categorylist = [
  const Category(
    name: "Kotlin",
    total: "Total - 1990",
    description: "Write better Android apps faster with Kotlin. Kotlin is a modern statically typed programming language ",
    image: "https://www.emanprague.com/en/wp-content/uploads/2017/07/1.-%C3%BAvodn%C3%AD-obr%C3%A1zek-1.png",
  ),
  const Category(
    name: "Flutter",
    total: "Total - 2000",
    description: "Flutter is Google's UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase",
    image: "https://engineering.letsnurture.com/wp-content/uploads/2018/07/flutter.png",
  ),
  const Category(
    name: "PHP",
    total: "Total - 1000",
    description: "PHP is a popular general-purpose scripting language that is especially suited to web development",
    image: "https://media.phpnuke.org/000/984/143/4d0_6f5_636_330-1-original.jpg",
  ),
  const Category(
    name: "Ionic",
    total: "Total - 1400",
    description: "Ionic is the app development platform for web developers. Build amazing cross platform mobile, web, and desktop apps all with one shared code base and open",
    image: "https://ionicframework.com/img/meta/ionic-framework-og.png",
  ),
];