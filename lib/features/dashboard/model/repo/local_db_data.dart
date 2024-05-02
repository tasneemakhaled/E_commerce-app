import 'package:project_fcii/features/dashboard/model/entity/service_model.dart';
import 'package:project_fcii/features/dashboard/model/repo/parent_data.dart';
import 'package:project_fcii/features/dashboard/model/entity/user_model.dart';
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
    final String path = databasePath + "/users.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE user (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
address TEXT )
""");
    await db.execute("""
CREATE TABLE services(
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
description TEXT,
color TEXT
 )
""");
  }

  Future<void> deleteUser({required int id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }

  Future<void> deleteServices({required int id}) async {
    await _database.delete('services', where: 'id=?', whereArgs: [id]);
  }

  Future<List<UserModel>> fetchUser() async {
    return (await _database.query('user'))
        .map((e) => UserModel.fromJson(e))
        .toList();
  }

  Future<List<ServiceModel>> fetchService() async {
    return (await _database.query('services'))
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  Future<void> insertUser({required String name, String? address}) async {
    await _database.insert('user', {'name': name, 'address': address});
  }

  Future<void> insertService(
      {required String name, String? description, String? color}) async {
    await _database.insert(
        'services', {'name': name, 'description': description, 'color': color});
  }
}
