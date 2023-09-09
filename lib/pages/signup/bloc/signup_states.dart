class SignUpStates {
  final String email;
  final String password;
  final String phonenumber;
  SignUpStates({this.phonenumber = "", this.password = "", this.email = ""});

  SignUpStates copyWith(
      {String? email, String? password, String? phonenumber}) {
    return SignUpStates(
        email: email ?? this.email,
        password: password ?? this.password,
        phonenumber: phonenumber ?? this.phonenumber);
  }
}
