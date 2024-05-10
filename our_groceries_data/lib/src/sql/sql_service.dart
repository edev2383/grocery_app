import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlService {
  Future<Database> initialize() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'our_groceries.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE stores (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)");

        await db.execute(
            "CREATE TABLE lists (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, scheduled_date TEXT, created_date TEXT )");

        await db.execute(
            "CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, plu TEXT, description TEXT, image_url TEXT, price REAL, quantity INTEGER, categoryId INTEGER, typeId INTEGER)");

        await db.execute(
            "CREATE TABLE lists_items_relation (list_id INTEGER, item_id INTEGER, quantity INTEGER)");

        await db.execute(
            "CREATE TABLE stores_items_relation (store_id INTEGER, item_id INTEGER, price REAL)");

        await db.execute(
            "CREATE TABLE item_category (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)");

        await db.execute(
            "CREATE TABLE item_type (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, itemCategoryId INTEGER)");
      },
      version: 1,
    );
  }
}
