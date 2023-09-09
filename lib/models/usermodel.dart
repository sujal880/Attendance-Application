class UserModel {
  String? empid;
  String? empemail;
  String? empphone;
  String? empname;
  String? empdesc;
  UserModel(
      {required this.empemail,
      required this.empid,
      required this.empphone,
      required this.empdesc,
      required this.empname});

  UserModel.fromMap(Map<String, dynamic> map) {
    empid = map["empid"];
    empemail = map["empemail"];
    empphone = map["empphone"];
    empname = map["empname"];
    empdesc = map["empdesc"];
  }

  Map<String, dynamic> toMap() {
    return {
      "empid": empid,
      "empemail": empemail,
      "empphone": empphone,
      "empname": empname,
      "empdesc": empdesc,
    };
  }
}
