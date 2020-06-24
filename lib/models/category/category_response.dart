
import 'package:programmingebook/models/category/category_model.dart';

class CategoryResponse
{
  final List<CategoryModel> results;
  final String error;

  CategoryResponse(this.results, this.error);

  CategoryResponse.fromJson(Map<String, dynamic> json)
      : results =(json["results"] as List).map((i) => new CategoryModel.fromJson(i)).toList(),
        error = "";

  CategoryResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;

}