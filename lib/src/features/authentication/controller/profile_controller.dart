import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notexpert/src/repository/user_repository/user_repository.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';

import '../models/user.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUser() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUser(email);
    } else {
      Get.snackbar("Error", "Login to continue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  updateUser(User user) async {
    await _userRepo.updateUser(user);
    Get.snackbar("Success", "Your profile has been updated successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.blue.withOpacity(0.3),
        colorText: Colors.black);
  }
}
