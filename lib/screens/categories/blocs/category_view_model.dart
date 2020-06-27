import 'package:flutter/cupertino.dart';
import 'package:programmingebook/services/base/base_bloc.dart';
import 'package:programmingebook/models/network_model/category/category_book.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';

class CategoryViewModel extends BaseApiBloc<List<CategoryBook>>
    with ChangeNotifier {
  AppRepository appRepository;

  CategoryViewModel(this.appRepository) {
    appRepository = AppRepository();
  }

  List<CategoryBook> _categoryBookList;

  List<CategoryBook> get categoryBookList => _categoryBookList;

  set categoryBookList(List<CategoryBook> value) {
    _categoryBookList = value;
    notifyListeners();
  }

  fetchCategoryList() async {
    startLoading('Fetching Category BookList');
    try {
      _categoryBookList = await appRepository.fetchCategoryBookList();
      addDataToStream(_categoryBookList);
    } catch (e) {
      print("error print"+e.toString());
      addErrorToStream(e);
    }
  }

  void dispose() {
    super.dispose();
    streamDispose();
  }
}
