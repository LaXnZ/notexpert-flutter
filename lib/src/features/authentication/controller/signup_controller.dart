import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';
import 'package:notexpert/src/repository/user_repository/user_repository.dart';

import '../models/user.dart';
import '../screens/homepage_screen/home_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(User user) async {
    await userRepo.createUser(user);

    Get.to(() => const HomePage());
  }
}
