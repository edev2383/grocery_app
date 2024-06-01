import 'package:our_groceries_resources/our_groceries_resources.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlService {
  Future<Database> initialize() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'our_groceries_app.db'),
      onCreate: (db, version) async {
        // create a user table to store the user's information
        await db.execute(
            "CREATE TABLE ${Globals.usersTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT, source INTEGER)");

        // create a table to store the stores the user shops at
        await db.execute(
            "CREATE TABLE ${Globals.storesTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.listsTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, scheduled_date TEXT, created_date TEXT, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.itemsTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, plu TEXT, description TEXT, image_url TEXT, categoryId INTEGER, typeId INTEGER, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.listItemRelTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, list_id INTEGER, item_id INTEGER, quantity INTEGER, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.storeItemRelTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, store_id INTEGER, item_id INTEGER, price REAL, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.itemCategoryTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, source INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.itemTypeTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, itemCategoryId INTEGER, source INTEGER)");

        // create a table that allows the user to associate items to a sequence
        // in a store, so that they can be sorted in the order they are found by
        // the user's desired path through the store
        await db.execute(
            "CREATE TABLE ${Globals.storeSequenceTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, store_id INTEGER, item_id INTEGER, sequence INTEGER)");

        // create a table that allows the user to associated items on a list in
        // a sequence, so that they can be sorted manually by the user in the
        // list GUI
        await db.execute(
            "CREATE TABLE ${Globals.listSequenceTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, list_id INTEGER, item_id INTEGER, sequence INTEGER)");

        await db.execute(
            "CREATE TABLE ${Globals.userListRelTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, list_id INTEGER, source INTEGER)");
      },
      version: 1,
    );
  }
}
