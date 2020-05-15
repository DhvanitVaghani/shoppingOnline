import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';


Database db;

class DatabaseCreator{
  static const itemTable = 'items';
  static const id = 'id';
  static const pname = 'pname';
  static const imageurl = 'imageurl';
  static const price = 'price';

   Future<void> createTodoTable(Database db) async {
    final itemSql = '''CREATE TABLE $itemTable
    (
      $id INTEGER PRIMARY KEY,
      $pname TEXT,
      $imageurl TEXT,
      $price TEXT
    )''';

    await db.execute(itemSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('item_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTodoTable(db);
  }
}