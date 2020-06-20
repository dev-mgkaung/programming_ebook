import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:programmingebook/models/book.dart';
import 'package:programmingebook/services/repositories/book_base_repository.dart';

class BookRepository extends BookBaseRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com';
  static const int perPage = 20;

  final http.Client _httpClient;

  BookRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Book>> getBookLists({int page}) async {
    List<Book> books = [];
    String requestUrl =
        '$_baseUrl/data/top/totalvolfull?limit=$perPage&tsym=USD&page=$page';
    try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> coinList = data['bookData'];
        coinList.forEach(
          (json) => books.add(Book.fromJson(json)),
        );
      }
      return books;
    } catch (err) {
      throw err;
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
