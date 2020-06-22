import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/services/networks/api_provider.dart';
import 'package:programmingebook/services/networks/response.dart';

class CategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<ApiResponse> fetchCategoryList() async {
    final response = await _provider.get(category_api);
    return response.fromJson(response);
  }
}