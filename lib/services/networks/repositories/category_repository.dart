import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/models/category/category_response.dart';
import 'package:programmingebook/utils/custom_exception.dart';


class CategoryRepository {

  final Dio dio = Dio(new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<CategoryResponse> getCategoryList() async {
    try {
        Response response = await dio.get(categorylist_url);
        dio.interceptors.add(PrettyDioLogger());
        return CategoryResponse.fromJson(jsonDecode(response.data));
       } catch (error, stackTrace) {
       print("Exception occured:$error stackTrace: $stackTrace");
      return CategoryResponse.withError(CustomException.handleError(error));
    }
  }
}
