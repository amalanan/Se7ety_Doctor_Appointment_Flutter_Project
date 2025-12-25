class SignInUserReq {
  final String email;
  final String password;
  final String role;
  SignInUserReq({
    required this.email,
    required this.password,
    required this.role
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
      "role": role
    };
  }
}
