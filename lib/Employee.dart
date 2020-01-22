class Employee {
  String firstname;
  String lastname;
  String mobileNo;
  String emailId;
  Employee(this.firstname, this.lastname, this.mobileNo, this.emailId);

  Employee.fromMap(Map map){
    firstname = map[firstname];
    lastname = map[lastname];
    mobileNo = map[mobileNo];
    emailId = map[emailId];
  }
}