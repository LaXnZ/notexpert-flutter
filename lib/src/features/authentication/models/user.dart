import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return User(
      id: document.id,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      password: data['password'],
    );
  }
}
