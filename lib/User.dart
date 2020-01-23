class User {
  String username;
  String password;
  String mobileNo;
  String emailId;
  User(this.username, this.password, this.mobileNo, this.emailId);

  User.fromMap(Map map){
    username = map[username];
    password = map[password];
    mobileNo = map[mobileNo];
    emailId = map[emailId];
  }
}