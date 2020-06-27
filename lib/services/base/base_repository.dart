
import 'package:programmingebook/models/network_model/popular/popular_book.dart';
import 'package:programmingebook/models/network_model/category/category_book.dart';

abstract class BaseRepository {

  Future<List<PopularBook>> fetchPopularBookList();

  Future<List<CategoryBook>> fetchCategoryBookList();

  Future<bool> isOnBoarded();
}
