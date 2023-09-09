class UserStates {
  final String empdesc;
  final String empname;
  UserStates({this.empdesc = "", this.empname = ""});

  UserStates copyWith({String? empdesc, String? empname}) {
    return UserStates(
        empname: empname ?? this.empname, empdesc: empdesc ?? this.empdesc);
  }
}
