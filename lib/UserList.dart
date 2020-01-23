import 'package:flutter/material.dart';
import 'package:simple/database/dbhelper.dart';

import 'User.dart';

Future<List<User>> fetchUsersFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<User>> users = dbHelper.getUser();
   return users;
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List"),),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<User>>(
          future: fetchUsersFromDatabase(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return Column(children: <Widget>[
                    Text(snapshot.data[index].username),
                    Text(snapshot.data[index].password),
                    Text(snapshot.data[index].emailId),
                    // Text(snapshot.data[index].city),
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