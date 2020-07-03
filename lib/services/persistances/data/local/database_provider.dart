import 'package:path/path.dart';
import 'package:programmingebook/models/entitys/shipping_address_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_SHIPPING = "shipping_table";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE= "title";
  static const String COLUMN_ADDRESS = "address";
  static const String COLUMN_CITY = "city";
  static const String COLUMN_COUNTRY = "country";
  static const String COLUMN_POSTAL = "postal";
  static const String COLUMN_CHECKED = "isChecked";
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'programmingebook.db'),
      version: 3,
      onCreate: (Database database, int version) async {
        //Shipping table
        await database.execute(
          "CREATE TABLE $TABLE_SHIPPING ("
              "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$COLUMN_TITLE TEXT,"
              "$COLUMN_ADDRESS TEXT,"
              "$COLUMN_CITY TEXT,"
              "$COLUMN_COUNTRY TEXT,"
              "$COLUMN_POSTAL TEXT,"
              "$COLUMN_CHECKED INTEGER"
              ")",
        );
      },
    );
  }

  //Get All items
  Future<List<ShippingAddressEntity>> getShippingAddressList() async {
    final db = await database;

    var shippingaddress = await db
        .query(TABLE_SHIPPING, columns: [COLUMN_ID, COLUMN_TITLE, COLUMN_ADDRESS, COLUMN_CITY,COLUMN_COUNTRY,COLUMN_POSTAL,COLUMN_CHECKED]);

    List<ShippingAddressEntity> shippingList = List<ShippingAddressEntity>();

    shippingaddress.forEach((currentdata) {
      ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity.fromMap(currentdata);
      shippingList.add(shippingAddressEntity);
    });

    return shippingList;
  }

//  //Searches shipping address by ID
//  Future<List<ShippingAddressEntity>> getShippingAddressById(int query) async {
//    final db = await database;
//    var shippingaddress = await db
//        .query(TABLE_SHIPPING, columns: [COLUMN_ID, COLUMN_TITLE, COLUMN_ADDRESS, COLUMN_CITY,COLUMN_COUNTRY,COLUMN_POSTAL,COLUMN_CHECKED],
//        where: 'id LIKE ?',
//        whereArgs: ["%$query%"]);
//
//    List<ShippingAddressEntity> shippingList = List<ShippingAddressEntity>();
//
//    shippingaddress.forEach((currentdata) {
//      ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity.fromMap(currentdata);
//      shippingList.add(shippingAddressEntity);
//    });
//    return shippingList;
//  }


  Future<ShippingAddressEntity> insert(ShippingAddressEntity shippingAddressEntity) async {
    final db = await database;
    shippingAddressEntity.id = await db.insert(TABLE_SHIPPING, shippingAddressEntity.toMap());
    return shippingAddressEntity;
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_SHIPPING,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(int id,ShippingAddressEntity shippingAddressEntity) async {
    final db = await database;

    return await db.update(
      TABLE_SHIPPING,
      shippingAddressEntity.toMap(),
      where: "id = ?",
      whereArgs: [id],
    );
  }
}