import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Book extends Equatable {
  final String book_name;
  final String book_description;
  final double book_price;

  const Book({
    @required this.book_name,
    @required this.book_description,
    @required this.book_price,
  });

  @override
  List<Object> get props => [
    book_name,
    book_description,
    book_price,
  ];

  @override
  String toString() =>
      'Book { name: $book_name, fullName: $book_description, price: $book_price }';

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      book_name: json['BookInfo']['Name'] as String,
      book_description: json['BookInfo']['Description'] as String,
      book_price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
    );
  }
}