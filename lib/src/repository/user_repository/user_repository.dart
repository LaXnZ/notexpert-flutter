import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/models/user.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(User user) async {
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.black))
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong, please try again later",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
