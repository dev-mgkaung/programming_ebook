import 'package:flutter/cupertino.dart';
import 'package:programmingebook/services/base/base_bloc.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';
import 'package:programmingebook/models/network_model/popular/popular_book.dart';

class PopularViewModel extends BaseApiBloc<List<PopularBook>>
    with ChangeNotifier {
  AppRepository appRepository;

  PopularViewModel(this.appRepository) {
    appRepository = AppRepository();
  }

  List<PopularBook> _popularBookList;

  List<PopularBook> get popularBookList => _popularBookList;

  set popularBookList(List<PopularBook> value) {
    _popularBookList = value;
    notifyListeners();
  }

  fetchPopularBookList() async {
    startLoading('Fetching Popular BookList');
    try {
      _popularBookList = await appRepository.fetchPopularBookList();
      addDataToStream(_popularBookList);
    } catch (e) {
      addErrorToStream(e);
    }
  }

  void dispose() {
    super.dispose();
    streamDispose();
  }
}
