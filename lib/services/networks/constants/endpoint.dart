class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl =
      //"https://jsonplaceholder.typicode.com";
     "https://raw.githubusercontent.com/dev-mgkaung/Knowledge-NoteList/gh-page";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // popular book list endpoints
  static const String bookPopular = "/popularlist.json";

  // popular category list endpoints
  static const String bookCategory = "/categories.json";

  // post newfeed list endpoints
  static const String bookPost = "/postlist.json";

}
