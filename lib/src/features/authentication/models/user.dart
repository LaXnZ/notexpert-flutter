class User {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}