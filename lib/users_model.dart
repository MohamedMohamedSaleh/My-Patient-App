class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
