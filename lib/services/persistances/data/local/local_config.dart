class DatabaseConfig {
  static const String databaseName = 'programingebook.db';
  static const int databaseVersion = 1;
  static const createTablesQueries = [
     'CREATE TABLE IF NOT EXISTS ShippingAddress(id INTEGER PRIMARY KEY, title TEXT, address TEXT, city TEXT, country TEXT, postal TEXT, isDefault NUMERIC)',
  ];
}
