import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

import '../User.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  initdb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, mobileno TEXT, emailId TEXT)");
    print("Created tables");
  }

  void saveUser(User user) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO User(username, password, mobileno, emailId) VALUES(' +
              '\'' +
              user.username +
              '\'' +
              ',' +
              '\'' +
              user.password +
              '\'' +
              ',' +
              '\'' +
              user.mobileNo +
              '\'' +
              ',' +
              '\'' +
              user.emailId +
              '\'' +
              ')');
    });
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> users = new List();
    for (int i = 0; i < list.length; i++) {
      users.add(new User(list[i]["username"], list[i]["password"],
          list[i]["mobileno"], list[i]["emailId"]));
    }
    print(users.length);
    return users;
  }


  // =======
  // Future<int> saveUser(User user) async {
  //   var dbClient = await con.db;
  //   int res = await dbClient.insert("User", user.toMap());
  //   return res;
  // }

  Future<User> goLogin(String user, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM User WHERE username = '$user' and password = '$password'");
    
    if (res.length > 0) {
      return new User.fromMap(res.first);
    }else{
      throw Exception('Failed to Login');
    }
  }
}
