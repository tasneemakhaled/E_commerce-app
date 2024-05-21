import 'dart:developer';
import 'dart:typed_data';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  static final DatabaseRepo _instance = DatabaseRepo._internal();
  static Database? _database;

  DatabaseRepo._internal();

  factory DatabaseRepo() {
    return _instance;
  }

  static Future<void> initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = databasePath + "/productsDB.db";
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, int version) async {
    await db.execute("""
CREATE TABLE products (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
description TEXT,
quantity INTEGER,
available_quantity INTEGER,
image BLOB,
favourite INTEGER,
cart INTEGER
)
""");
  }

  Future<Database> get database async {
    if (_database == null) {
      await initDatabase();
    }
    return _database!;
  }

  Future<List<ProductModel>> fetchProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('products', where: 'favourite = ?', whereArgs: [1]);
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('products', where: 'cart = ?', whereArgs: [1]);
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<void> insertProduct(String name, String desc, int quantity,
      int availableQuantity, Uint8List image) async {
    final db = await database;
    await db.insert('products', {
      'name': name,
      'description': desc,
      'quantity': quantity,
      'available_quantity': availableQuantity,
      'image': image,
      'favourite': 0,
      'cart': 0,
    });
  }

  Future<void> newQuantity(int qnt, int id) async {
    final db = await database;
    await db.update(
      'products',
      {'available_quantity': qnt},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCart(int val, int id) async {
    final db = await database;
    await db.update(
      'products',
      {'cart': val},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateFavorite(int val, int id) async {
    final db = await database;
    await db.update(
      'products',
      {'favourite': val},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}

// import 'dart:developer';
// import 'dart:ffi';
// import 'dart:typed_data';
// import 'package:project_fcii/features/dashboard/modules/model/repo/apis_data.dart';
// import 'package:project_fcii/features/dashboard/modules/model/repo/parent_data.dart';
// import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseRepo {
//   //DatabaseRepo._init();
//   static late Database database;
//   static Future<void> initDatabase() async {
//     final String databasePath = await getDatabasesPath();
//     final String path = databasePath + "/productsDB.db";
//     database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createTables,
//     );
//   }

//   static Future<void> _createTables(Database db, _) async {
//     await db.execute("""
// CREATE TABLE products (
// id INTEGER PRIMARY KEY AUTOINCREMENT, 
// name TEXT NOT NULL, 
// description TEXT,
// quantity INTEGER,
// available_quantity INTEGER,
// image BLOB ,
// favourite INTEGER,
// cart INTEGER,
// )
// """);
//   }

//   Future<List<ProductModel>> fetchProducts() async {
//     log((await database.getVersion()).toString());
//     return (await database.query('products'))
//         .map((e) => ProductModel.fromJson(e))
//         .toList();
//   }

//   Future<List<ProductModel>> fetchFavoriteProducts() async {
//     return (await database
//             .query('products', where: 'favourite=?', whereArgs: [1]))
//         .map((e) => ProductModel.fromJson(e))
//         .toList();
//   }

//   Future<List<ProductModel>> fetchCartProducts() async {
//     return (await database.query('products', where: 'cart=?', whereArgs: [1]))
//         .map((e) => ProductModel.fromJson(e))
//         .toList();
//   }

//   void insertProduct(String name, String desc, int quantity,
//       int availableQuantity, Uint8List image) {
//     database.insert('products', {
//       'name': name,
//       'description': desc,
//       'quantity': quantity,
//       'available_quantity': availableQuantity,
//       'image': image,
//       'favourite': 0,
//       'cart': 0,
//     });
//   }

//   Future<void> newQuantity(int qnt, int id) async {
//     await database.update(
//         'products',
//         {
//           'available_quantity': qnt,
//         },
//         where: 'id=?',
//         whereArgs: [id]);
//   }

//   Future<void> updateCart(int val, int id) async {
//     await database.update(
//         'products',
//         {
//           'cart': val,
//         },
//         where: 'id=?',
//         whereArgs: [id]);
//   }

//   Future<void> updateFavorite(int val, int id) async {
//     await database.update(
//         'products',
//         {
//           'favourite': val,
//         },
//         where: 'id=?',
//         whereArgs: [id]);
//   }

//   void deleteProduct(int id) {
//     database.delete('products', where: 'id=?', whereArgs: [id]);
//   }
// }
