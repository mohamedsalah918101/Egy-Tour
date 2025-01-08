class User {
  final String userName;
  final String email;
  final String password;
  final String? phoneNumber;
  List<String> favorites;

  User({
    required this.userName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.favorites = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'favorites': favorites,
    };
  }
}
