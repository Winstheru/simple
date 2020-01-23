class User {
  String username;
  String password;
  String city;
  User(this.username, this.password, this.city);

  User.fromMap(Map map){
    username = map[username];
    password = map[password];
    city = map[city];
  }
}