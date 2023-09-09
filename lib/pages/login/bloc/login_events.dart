abstract class LoginEvents {}

class LoginEmailEvents extends LoginEvents {
  String email;
  LoginEmailEvents({required this.email});
}

class LoginPasswordEvents extends LoginEvents {
  String password;
  LoginPasswordEvents({required this.password});
}
