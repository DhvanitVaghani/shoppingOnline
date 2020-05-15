import 'package:shoppingapp/DatabaseClasses/model/item.dart';
import 'package:sqflite/sqflite.dart';
import 'data_helper.dart';

class DataBaseService {
  static Future<List<Item>> getAllItem() async {
    final List<Map<String, dynamic>> maps = await db.query('${DatabaseCreator.itemTable}');

    return List.generate(maps.length, (i) {
      return Item(
          id: maps[i]['id'],
          pname: maps[i]['pname'],
          imageurl: maps[i]['imageurl'],
          price: maps[i]['price']);
    });
  }

  static Future<int> additem(Item item) async {
    // final sql = '''INSERT INTO ${DatabaseCreator.itemTable}
    // (
    //   ${DatabaseCreator.id},
    //   ${DatabaseCreator.pname},
    //   ${DatabaseCreator.imageurl},
    //   ${DatabaseCreator.price}
    // )
    // // VALUES (?,?,?,?)''';
    final result = await db.insert(
      '${DatabaseCreator.itemTable}',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // List<dynamic> params =item.toMap();
    // final result = await db.rawInsert(sql, );
    print(result);
    return result;
  }

  static Future<int> deleteitem(int id) async {
    int result = await db.rawDelete(
        'DELETE FROM ${DatabaseCreator.itemTable} WHERE ${DatabaseCreator.id} = $id');
    return result;
  }
}
