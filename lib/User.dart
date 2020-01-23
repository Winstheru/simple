class User {
  String username;
  String password;
  String emailId;
  User(this.username, this.password, this.emailId);

  User.fromMap(Map map){
    username = map[username];
    password = map[password];
    emailId = map[emailId];
  }
}