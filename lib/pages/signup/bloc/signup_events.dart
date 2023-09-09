abstract class Signup_Events {
  const Signup_Events();
}

class EmailEvents extends Signup_Events {
  final String email;
  EmailEvents(this.email);
}

class PasswordEvents extends Signup_Events {
  final String password;
  PasswordEvents(this.password);
}

class PhoneNumberEvents extends Signup_Events {
  final String phonenumber;
  PhoneNumberEvents(this.phonenumber);
}
