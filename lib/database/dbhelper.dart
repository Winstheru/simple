import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

import '../Employee.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if(_db != null) return _db;
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
    await db.execute("CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT, emailId TEXT)");
    print("Created tables");
  }

  void saveEmployee(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
        'INSERT INTO EMPLOYEE(firstname, lastname, mobileno, emailId) VALUES(' + 
        '\'' + employee.firstname +
        '\'' +
        ',' +
        '\'' +
        employee.lastname +
        '\'' +
        ',' +
        '\'' + employee.mobileNo +
        '\'' +
        ',' +
        '\'' +
        employee.emailId +
        '\'' +
        ')');
    });
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for(int i = 0; i < list.length; i++){
      employees.add(new Employee(list[i]["firstname"], list[i]["lastname"], list[i]["mobileno"], list[i]["emailId"]));
    }
    print(employees.length);
    return employees;
  }
}