abstract class UserEvents{
  const UserEvents();
}

class EmployName extends UserEvents{
  final String empname;
  EmployName({required this.empname});
}

class EmployDesicnation extends UserEvents{
  final String empdesc;
  EmployDesicnation({required this.empdesc});
}