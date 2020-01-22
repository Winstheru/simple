import 'package:flutter/material.dart';
import 'package:simple/database/dbhelper.dart';

import 'Employee.dart';

Future<List<Employee>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Employee>> employees = dbHelper.getEmployees();
   return employees;
}

class MyEmployeeList extends StatefulWidget {
  @override
  _MyEmployeeListState createState() => _MyEmployeeListState();
}

class _MyEmployeeListState extends State<MyEmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<Employee>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return Column(children: <Widget>[
                    Text(snapshot.data[index].firstname),
                    Text(snapshot.data[index].lastname),
                    Text(snapshot.data[index].mobileNo),
                    Text(snapshot.data[index].emailId),
                    Divider(thickness: 2,),
                  ],);
                },
              );
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return Container(alignment: AlignmentDirectional.center, child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}