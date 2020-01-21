class User {
  String userName;
  String userCity;
  int userAge;
  User({this.userName, this.userCity, this.userAge});

  User.fromJson(Map<String, dynamic> json){
    userName = json['name'];
    userCity = json['city'];
    userAge = json['age'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.userName;
    data['city'] = this.userCity;
    data['age'] = this.userAge;
    return data;
  }
}