
import 'package:programmingebook/models/network_model/newEvent/models.dart';

class PostResponse {
  List<Post> results;

  PostResponse({this.results});

  PostResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Post>();
      json['results'].forEach((v) {
        results.add(new Post.fromJson(v));
      });
    }
  }

}
