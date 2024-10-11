class UserModel {
  final String email;
  final String username;
  final String name;
  final String ?token;

  const UserModel({
    required this.email,
    required this.name,
    this.token,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
    token: json['token'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'username': username,
        'token': token,
      };
}
