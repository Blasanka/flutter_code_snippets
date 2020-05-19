import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:so_answers/utility_demos/user_management/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  // create database
  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // create tables
  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(uid INTEGER AUTO INCREMENT PRIMARY KEY, token TEXT, user TEXT)");
    // note that Im inserting password as plain text. When you implement please store it as a hash for security purposes.
  }

  // insert user to db when login
  Future<int> saveUser(User user) async {
    Database dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  // retrieve user from db
  Future<User> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    if (list.isNotEmpty) {
      return User.fromJson(list.elementAt(0));
    }
    return null;
  }

  //delete use when logout
  Future<int> deleteUser() async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  // check if the user logged in when app launch or any other place
  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("User");
    return res.length > 0 ? true : false;
  }
}