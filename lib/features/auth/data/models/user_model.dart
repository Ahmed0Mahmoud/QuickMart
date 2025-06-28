class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'] ?? "user name",
      email: jsonData['email'] ?? "user email",
    );
  }
}
