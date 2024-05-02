import 'dart:developer';
import 'dart:ffi';
import 'package:project_fcii/features/dashboard/modules/model/repo/apis_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/repo/parent_data.dart';
import 'package:project_fcii/features/dashboard/modules/model/entity/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  DatabaseRepo._init();

  static DatabaseRepo? _singletoneObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance async {
    if (_singletoneObject == null) {
      await _initDatabase();
      _singletoneObject = DatabaseRepo._init();
    }
    return _singletoneObject!;
  }

  ///create database
  static Future<void> _initDatabase() async {
    ///get database path on the target device
    final String databasePath = await getDatabasesPath();

    ///add your database files
    final String path = databasePath + "/products.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE products (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
description TEXT,
quantity INTEGER,
available_quantity INTEGER,
image BLOB,
favourite INTEGER,
cart INTEGER,
)
""");
  }

  Future<List<ProductModel>> fetchProducts() async {
    log((await _database.getVersion()).toString());
    return (await _database.query('products'))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await _database
            .query('products', where: 'favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    return (await _database.query('products', where: 'cart=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  void insertProduct(
      {required String name,
      required String desc,
      required int quantity,
      required int availableQuantity,
      required Uint8 image}) {
    _database.insert('products', {
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
    await _database.update(
        'products',
        {
          'available_quantity': qnt,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateCart(int val, int id) async {
    await _database.update(
        'products',
        {
          'cart': val,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateFavorite(int val, int id) async {
    await _database.update(
        'products',
        {
          'favorite': val,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void deleteProduct(int id) {
    _database.delete('products', where: 'id=?', whereArgs: [id]);
  }
}
