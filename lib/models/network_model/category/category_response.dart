
import '../../network_model/category/category_book.dart';

class CategoryResponse
{

   List<CategoryBook> results;

   CategoryResponse({this.results});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<CategoryBook>();
      json['results'].forEach((v) {
        results.add(new CategoryBook.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

}