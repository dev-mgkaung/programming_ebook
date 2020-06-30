import 'package:meta/meta.dart';

BookList booklist = BookList(books: [
  Book(
      title: "Flutter for Beginner",
      cover:
          "https://www.packtpub.com/media/catalog/product/cache/bf3310292d6e1b4ca15aeea773aca35e/9/7/9781788996082-original.png",
      age: "ALL AGE",
      author: "Dr. Maingesg",
      authorImg:
          "https://d2sofvawe08yqg.cloudfront.net/howtobuildmobileappswithflutter/hero2x?1549504504",
      franchise: true,
      genre: "Fantasy",
      lanugage: "ENGLISH",
      rating: 4.5,
      price: 16.45,
      summary:
          "Chapter 1, Introducting Flutter, covers a brief introduction to Flutter and how this book is going to serve you as a guide for learning cross-platform application development with Flutter. We will then move on to where and how Flutter originated. Then, before moving on to why Flutter is a good option, we will take a look at where Flutter fits in with the existing world of mobile application development."
          "Chapter 2, Getting Started with Flutter, covers the installation of the tools needed to use Flutter and gets readers familiar with IDE, as well as looking at Hot reload, one of the best features in Flutter. We will then learn aboutwo principal concepts that are required in every application development workflow—debugging and testing.Chapter 3, Widgets, Widgets Everywhere, goes through the widget catalog and explains how to create custom widgets. We will then learn how to route and navigate through these widgets.",
      wideImage:
          "https://1.bp.blogspot.com/-3_4G02Nw5ys/XU7Zqr76CkI/AAAAAAAABU4/6T9Wi0hugBo7hhspu1eo9PHeRS9TRHCJACLcBGAs/s640/Google%2BFlutter%2BMobile%2BDevelopment%2BQuick%2BStart%2BGuide.png"),
]);

class BookList {
  List<Book> books;
  BookList({
    @required this.books,
  });
}

class Book {
  String title;
  double price;
  String cover;
  String author;
  String genre;
  String lanugage;
  String authorImg;
  bool franchise;
  String summary;
  String wideImage;
  String age;
  double rating;

  Book({
    @required this.title,
    @required this.price,
    @required this.cover,
    @required this.author,
    @required this.age,
    @required this.authorImg,
    @required this.franchise,
    @required this.genre,
    @required this.lanugage,
    @required this.summary,
    @required this.wideImage,
    @required this.rating,
  });
}
