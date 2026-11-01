class LoginDtos {
  final String user;
  final String password;
  final String uuid;

  LoginDtos({required this.user, required this.password, required this.uuid});

  Map<String, String> toJson() => {
    "email": user,
    "password": password,
    "uuid": uuid,
  };
}
