import 'dart:convert';

import 'package:programmingebook/services/base/base_repository.dart';
import 'package:programmingebook/services/networks/constants/endpoint.dart';
import 'package:programmingebook/services/persistances/data/sharedpref/constants/preferences.dart';
import 'package:programmingebook/services/persistances/data/sharedpref/preference_connector.dart';
import '../api_clients/rest_client.dart';

import 'package:programmingebook/models/network_model/popular/popular_book_response.dart';
import 'package:programmingebook/models/network_model/popular/popular_book.dart';
import 'package:programmingebook/models/network_model/category/category_book.dart';
import 'package:programmingebook/models/network_model/category/category_response.dart';

class AppRepository extends BaseRepository {
  final String _apiKey = "Your Api Key Here";

  RestClient _helper = RestClient();

  PreferenceConnector preferenceConnector;

  AppRepository() {
    preferenceConnector = PreferenceConnector();
  }

  @override
  Future<List<PopularBook>> fetchPopularBookList() async {
    final response = await _helper.get("${Endpoints.bookPopular}");
    return PopularBookResponse.fromJson(response).results;
  }

  @override
  Future<List<CategoryBook>> fetchCategoryBookList() async {
    final response = await _helper.get("${Endpoints.bookCategory}");
    return CategoryResponse.fromJson(response).results;
  }

  @override
  Future<bool> isOnBoarded() {
    return preferenceConnector.getBool(PreferenceConstants.is_onboarding);
  }

  @override
  void setOnBoarded(bool value) {
    preferenceConnector.setBool(PreferenceConstants.is_onboarding, value);
  }
}
