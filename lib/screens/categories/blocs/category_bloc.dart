
import 'package:programmingebook/models/category/category_response.dart';
import 'package:programmingebook/services/networks/repositories/category_repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoryListBloc {
  final CategoryRepository repository = CategoryRepository();
  final BehaviorSubject<CategoryResponse> _subject =
  BehaviorSubject<CategoryResponse>();

  getCategoryList() async {
    CategoryResponse response = await repository.getCategoryList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CategoryResponse> get subject => _subject;

}
final categoryBloc = CategoryListBloc();