import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  bool isGoogleLoading = false;

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .signInWithEmailAndPassword(email, password);
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading = false;
      AuthenticationRepository.instance.setInitialScreen(
          AuthenticationRepository.instance.firebaseUser.value);
    } catch (_) {
      isGoogleLoading = false;
      print('Google Sign In Error: ${_.toString()}');
    }
  }
}
