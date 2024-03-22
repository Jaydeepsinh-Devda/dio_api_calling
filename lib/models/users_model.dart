class UsersModel {
  final String name;
  final String email;

  const UsersModel({
    required this.name,
    required this.email,
  });

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      name: map['name'],
      email: map['email'],
    );
  }
}
