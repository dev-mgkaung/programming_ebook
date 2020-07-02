import 'package:equatable/equatable.dart';


class Post extends Equatable {

  String title;
  String body;

  Post({ this.title, this.body});

  @override
  List<Object> get props => [title, body];

  @override
  String toString() => 'Post { title: $title }';

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }
}
