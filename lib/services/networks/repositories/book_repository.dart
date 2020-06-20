import 'package:programmingebook/services/networks/api_provider.dart';
import 'package:programmingebook/services/networks/response.dart';

class BookRepository {
  ApiProvider _provider = ApiProvider();

  Future<ApiResponse> fetchBookList(String category) async {
    final response = await _provider.get("jokes/random?category=" + category);
    return response.fromJson(response);
  }
}