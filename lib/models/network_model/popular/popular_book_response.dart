import '../../network_model/popular/popular_book.dart';

class PopularBookResponse {

  List<PopularBook> results;

  PopularBookResponse({this.results});

  PopularBookResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<PopularBook>();
      json['results'].forEach((v) {
        results.add(new PopularBook.fromJson(v));
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