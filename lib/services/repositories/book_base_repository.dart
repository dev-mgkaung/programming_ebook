import 'package:flutter/material.dart';
import 'package:programmingebook/models/book.dart';
abstract class BookBaseRepository {
  Future<List<Book>> getBookLists({int page});
  void dispose();
}